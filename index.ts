import fs from "fs";
import puppeteer, { Browser, Page, PuppeteerError, TimeoutError } from 'puppeteer';
import * as db from './modules/db/index'

class DatabaseManager {
    /** Single source of truth for database operations */
    static async executeQuery<T>(query: string, params?: any[]) {
        const result = await db.query(query, params);
        return result;
    }
}

// Documentation around puppeteer errors 
// https://puppeteer.guide/errors/
// https://puppeteer.guide/posts/handling-navigation-errors/

// Todo 
class BrowserManager {
    /** Single source of truth for browser operations */
    static async manageBrowserAndPage(browserURL: string, lastSequenceNumber: number, scrapeDataLambda: (page: Page, questionNumber: number) => Promise<void>) {
        let browser;
        let page;
        try {
            // One Browser Session
            browser = await puppeteer.connect({ browserURL });
            // One Page Session
            page = await browser.newPage();
            await BrowserManager.reusePage(page, lastSequenceNumber, scrapeDataLambda);

        } catch (generalError) {
            // handle the error

        } finally {
            // close the page if it was opened
            if (page) {
                await page.close();
            }
            // close the browser if it was opened
            if (browser) {
                await browser.close();
            }
        }
    }

    static async manageBrowserAndPageOverload(browserURL: string, questionsLink: string, questionNumber: number, scrapeDataLambda: (page: Page, questionNumber: number) => Promise<void>) {
        let browser;
        let page;
        try {
            // One Browser Session
            browser = await puppeteer.connect({ browserURL });
            // One Page Session
            page = await browser.newPage();
            await BrowserManager.reusePageOverload(page, questionsLink, questionNumber, scrapeDataLambda);

        } catch (generalError) {
            // handle the error

        } finally {
            // close the page if it was opened
            if (page) {
                await page.close();
            }
            // close the browser if it was opened
            if (browser) {
                await browser.close();
            }
        }
    }

    static async reusePage(page: Page, lastSequenceNumber: number, scrapeDataLambda: (page: Page, questionNumber: number) => Promise<void>) {
        // Reuse Page Session
        // 272 is not reusable, you get number with max count
        // 272 should be part of the lambda scope since it's the implementation
        for (let i = lastSequenceNumber; i <= 272;) {
            const questionslinkResult = await DatabaseManager.executeQuery(`SELECT link FROM questionslink where number = ${i};`)
            const questionslink: string = questionslinkResult.rows[0].link;

            await BrowserManager.errorHandlingBoilerPlate(page, questionslink);

            // now you can try to perform your actions
            await scrapeDataLambda(page, i);

            // Increment 
            const result = await DatabaseManager.executeQuery("SELECT nextval('seq_questions') as next_value;")
            let sequenceLastValue: number = result.rows[0].next_value;
            i = sequenceLastValue;

            // Wait random time between 1min–1min30s
            const delay = randomDelay(33000, 60000);
            console.log(`Waiting ${delay / 1000}s...`)
            await new Promise(resolve => setTimeout(resolve, delay));
        }
    }

    // This function lacks 
    // I will have to properly learn overloading in the future
    static async reusePageOverload(page: Page, questionsLink: string, questionNumber: number, scrapeDataLambda: (page: Page, questionNumber: number) => Promise<void>) {
        await BrowserManager.errorHandlingBoilerPlate(page, questionsLink);

        // now you can try to perform your actions
        await scrapeDataLambda(page, questionNumber);
    }


    static async errorHandlingBoilerPlate(page: Page, questionslink: string) {
        let response;
        try {
            // try navigation with a short timeout
            response = await page.goto(questionslink, {
                timeout: 5000, // 5 seconds
                waitUntil: "domcontentloaded",
            });
        } catch (error: any) {
            // handle navigation and timeout errors

            if (error instanceof TimeoutError) {
                // you might decide to re-try, throw, or move on.
                // for demonstration, we continue with the partially loaded page.
            } else if (error.message && error.message.startsWith("net::ERR")) {
                // networking error (DNS, connection, etc). handle or re-try if needed.
                // e.g., throw error;
            } else {
                // an unexpected navigation error occurred
                throw error;
            }
        }

        // if we did get a response, check HTTP status codes
        if (response) {
            const status = response.status();
            if (status >= 400) {
                // handle the error
            }
        } else {
            // no initial response object was returned, try waiting for a response
            try {
                const waitedResponse = await page.waitForResponse(() => true, {
                    timeout: 5000,
                });
                const waitedStatus = waitedResponse.status();
                if (waitedStatus >= 400) {
                    // handle the error
                }
            } catch (waitError) {
                // handle the error
            }
        }

        // check if the page fell back to a default browser error page
        if (page.url().startsWith("chrome-error://")) {
            // optionally inspect page content for the specific reason
            const content = await page.content();
            if (content.includes("ERR_NAME_NOT_RESOLVED")) {
                // handle the error
            } else if (content.includes("ERR_INTERNET_DISCONNECTED")) {
                // handle the error
            } else {
                // handle the error
            }

            // decide how to handle: throw, return, etc.
            // for demonstration, we will return early.
            return;
        }
    }

    // What is the order of the SQL Files loaded?
    // 1) lambda()'s       result                         uses docker_pg_seq_schema.sql
    // 2) lambda()'s       Question, Answers, Answers     uses docker_pg_schema.sql
    // 3) reusepage()'s    questionslink                  uses docker_pg_scraper.sql
    // 4) reusepage()'s    increment                      uses docker_pg_seq_schema.sql

    // There are dependencies for this function, need to run SQL in this order
    // 1) docker_pg_scraper.sql
    // 2) docker_pg_seq_scraper.sql
    // 3) Scrape the questions link first.
    // 4) docker_pg_schema.sql
    // 5) docker_pg_seq_schema.sql
    // 6) Run lambda()

    static async lambda() {
        const scrapeDataLambda = async (page: Page, i: number) => {
            try {
                console.log("Page loaded");
                await page.locator('.popup-overlay.show').wait();
                console.log("Popup detected");

                // Apparently page.evaluate is like opening up console
                await page.evaluate(() => {
                    const el = document.querySelector('.popup-overlay.show');
                    if (el) {
                        el.className = 'popup-overla show';
                    }
                });
            } catch (error) {
                console.log("Popup not detected");
            }

            try {
                await page.locator('.load-full-discussion-button').wait();
                console.log("Load Discussions button detected");
                await page.locator('.load-full-discussion-button').click();
                console.log("clicked load Discussions button");
                // Wait for load discussion to finish
                await new Promise(resolve => setTimeout(resolve, 5000));
            } catch (error) {
                console.log("Load Discussions button not detected");
            }

            // Question
            let question = await Question.create(page, i, '1z0-071');
            console.log(question);
            await Question.insert(question);

            // Answers
            let answers = []
            try {
                answers = await Answer.create(page, i, '1z0-071');
            } catch (error) {
                console.log("cannot find answers")
                answers = await Answer.newCreate(page, i, '1z0-071');
            }

            for (let i = 0; i < answers.length; i++) {
                console.log(answers[i]);
                await Answer.insert(answers[i]);
            }

            // Discussions
            let discussions = await Discussion.create(page, i, '1z0-071');
            for (let i = 0; i < discussions.length; i++) {
                console.log(discussions[i]);
                await Discussion.insert(discussions[i]);
            }
        }

        const result = await DatabaseManager.executeQuery("SELECT last_value FROM seq_questions;");
        let sequenceLastValue: number = result.rows[0].last_value;
        await BrowserManager.manageBrowserAndPage("http://127.0.0.1:9222", sequenceLastValue, scrapeDataLambda);
    }

}

async function nodeRecursion(el: Element | ChildNode, array: any[]) {
    if (el.hasChildNodes()) {
        for (let i = 0; i < el.childNodes.length; i++) {
            await nodeRecursion(el.childNodes[i], array);
        }
    }
    // @ts-ignore
    if (el.className === 'comment-selected-answers badge badge-warning') {
        // console.log(el.textContent?.trim());
        array.push(el.textContent?.trim());
    }
    // @ts-ignore
    else if (el.className === 'comment-content') {
        // console.log(el.textContent?.trim());
        array.push(el.textContent?.trim());

    }
    // @ts-ignore
    else if (el.className === 'ml-2 upvote-text') {
        // console.log(el.textContent?.trim());
        array.push(el.textContent?.trim());

    }
}

class Company {
    private _name: string
    public constructor(name: string) {
        this._name = name;
    }

    public get name(): string {
        return this._name;
    }
}

class Question {
    private _number: number
    private _exam: string
    private _text: string
    private constructor(number: number, exam: string, text: string) {
        this._number = number;
        this._exam = exam;
        this._text = text;
    }

    public get number(): number {
        return this._number;
    }

    public get exam(): string {
        return this._exam;
    }

    public get text(): string {
        return this._text;
    }

    public static async create(page: Page, number: number, exam: string): Promise<Question> {
        const element = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[1]/div[2]/p)');
        let arrayOfText = await element?.evaluate(el => {
            let answer = [];
            for (let i = 0; i < el.childNodes.length; i++) {
                // @ts-ignore
                if (el.childNodes[i].nodeName === 'IMG') answer.push(el.childNodes[i].src);
                else answer.push(el.childNodes[i].textContent?.trim());
            }
            return answer;
        });
        const result = arrayOfText?.filter(str => str !== '').join('\n');
        console.log(result);
        return new Question(number, exam, result ?? 'null');
    }

    public static async insert(question: Question) {
        const query = `
INSERT INTO questions
    (number, exam, text)
VALUES ($1, $2, $3);
`;

        const values = [
            question.number,
            question.exam,
            question.text
        ];

        const result = await DatabaseManager.executeQuery(query, values);
        console.log(result);
    }
}

class Exam {
    private _name: string
    private _company: string
    public constructor(name: string, company: string) {
        this._name = name;
        this._company = company;
    }

    public get name(): string {
        return this._name;
    }

    public get company(): string {
        return this._company;
    }
}

class Answer {
    private _number: number
    private _questionNumber: number
    private _questionExam: string
    private _text: string
    private _isCorrect: boolean
    private constructor(number: number, questionNumber: number, questionExam: string, text: string, isCorrect: boolean) {
        this._number = number;
        this._questionNumber = questionNumber;
        this._questionExam = questionExam;
        this._text = text;
        this._isCorrect = isCorrect;
    }

    public get number(): number {
        return this._number;
    }

    public get questionNumber(): number {
        return this._questionNumber;
    }

    public get questionExam(): string {
        return this._questionExam;
    }

    public get text(): string {
        return this._text;
    }

    public get isCorrect(): boolean {
        return this._isCorrect;
    }

    public static async create(page: Page, questionNumber: number, questionExam: string): Promise<Answer[]> {
        let list: Answer[] = [];
        const questionsElement = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[1]/div[2]/div[2]/ul)')
        const questionsChildNodesLength = await questionsElement?.evaluate(el => el.childElementCount);
        if (questionsChildNodesLength !== undefined) {
            for (let i = 1; i <= questionsChildNodesLength; i++) {
                const element = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[1]/div[2]/div[2]/ul/li[' + i + '])');
                let answer = await element?.evaluate(el => {
                    let answer = '';
                    for (let i = 0; i < el.childNodes.length; i++) {
                        if (el.childNodes[i].nodeName === 'IMG') {
                            // @ts-ignore
                            answer += el.childNodes[i].src;
                        } else {
                            answer += el.childNodes[i].textContent?.trim()
                        }
                    }
                    return answer;
                });
                console.log(answer);

                let answerObj = new Answer(i, questionNumber, questionExam, answer ?? 'null', answer?.includes("Most Voted") ?? false);
                list.push(answerObj);
            }
        }
        return list;
    }

    public static async newCreate(page: Page, questionNumber: number, questionExam: string): Promise<Answer[]> {
        const element = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[1]/div[2]/p)');
        let arrayOfText = await element?.evaluate(el => {
            let answer = [];
            for (let i = 0; i < el.childNodes.length; i++) {
                // @ts-ignore
                if (el.childNodes[i].nodeName === 'IMG') answer.push(el.childNodes[i].src);
                else answer.push(el.childNodes[i].textContent?.trim());
            }
            return answer;
        });

        // Check A, B, C, D
        let answerList: Answer[] = [];
        const resultList = arrayOfText?.filter(str => str !== '');
        if (resultList !== undefined) {
            for (let i = 0; i < resultList.length; i++) {
                let element: string = resultList[i]
                console.log(element);
                switch (element) {
                    case 'A.': {
                        let answer = 'A. ' + resultList[i + 1];
                        console.log(answer);
                        let answerObj = new Answer(i, questionNumber, questionExam, answer ?? 'null', answer?.includes("Most Voted") ?? false);
                        answerList.push(answerObj);
                        i++;
                        continue;
                    }
                    case 'B.': {
                        let answer = 'B. ' + resultList[i + 1];
                        console.log(answer);
                        let answerObj = new Answer(i, questionNumber, questionExam, answer ?? 'null', answer?.includes("Most Voted") ?? false);
                        answerList.push(answerObj);
                        i++;
                        continue;;
                    }
                    case 'C.': {
                        let answer = 'C. ' + resultList[i + 1];
                        console.log(answer);
                        let answerObj = new Answer(i, questionNumber, questionExam, answer ?? 'null', answer?.includes("Most Voted") ?? false);
                        answerList.push(answerObj);
                        i++;
                        continue;;
                    }
                    case 'D.': {
                        let answer = 'D. ' + resultList[i + 1];
                        console.log(answer);
                        let answerObj = new Answer(i, questionNumber, questionExam, answer ?? 'null', answer?.includes("Most Voted") ?? false);
                        answerList.push(answerObj);
                        i++;
                        continue;
                    }
                    default: continue;
                }
            }
        }
        return answerList;
    }

    public static async insert(answer: Answer) {
        const query = `
INSERT INTO answers
    (number, question_number, question_exam, text, is_correct)
VALUES ($1, $2, $3, $4, $5);
`;

        const values = [
            answer.number,
            answer.questionNumber,
            answer.questionExam,
            answer.text,
            answer.isCorrect
        ];

        const result = await DatabaseManager.executeQuery(query, values);
        console.log(result);
    }

    public static async merge(answer: Answer) {
        const query = `
MERGE INTO answers
USING (
SELECT CAST($1 AS integer) AS number, CAST($2 AS integer) AS question_number, CAST($3 AS text) AS question_exam, CAST($4 AS text) AS text, CAST($5 AS boolean) AS is_correct
) AS src
ON answers.number = src.number AND answers.question_number = src.question_number AND answers.question_exam = src.question_exam 
WHEN MATCHED THEN
    UPDATE SET text = src.text, is_correct = src.is_correct
WHEN NOT MATCHED THEN
    INSERT (number, question_number, question_exam, text, is_correct) VALUES (src.number, src.question_number, src.question_exam, src.text, src.is_correct); 
        `

        const values = [
            answer.number,
            answer.questionNumber,
            answer.questionExam,
            answer.text,
            answer.isCorrect
        ];

        const result = await DatabaseManager.executeQuery(query, values);
        console.log(result);
    }
}

class Discussion {
    private _number: number
    private _questionNumber: number
    private _questionExam: string
    private _selectedAnswer: string
    private _text: string
    private _upvote: number
    private constructor(number: number, questionNumber: number, questionExam: string, selectedAnswer: string, text: string, upvote: number) {
        this._number = number;
        this._questionNumber = questionNumber;
        this._questionExam = questionExam;
        this._selectedAnswer = selectedAnswer;
        this._text = text;
        this._upvote = upvote;
    }

    public get number(): number {
        return this._number;
    }

    public get questionNumber(): number {
        return this._questionNumber;
    }

    public get questionExam(): string {
        return this._questionExam;
    }

    public get selectedAnswer(): string {
        return this._selectedAnswer;
    }

    public get text(): string {
        return this._text;
    }

    public get upvote(): number {
        return this._upvote;
    }

    // Builder Pattern (Not used)
    static Builder = class {
        private _selectedAnswer: string
        private _text: string
        private _upvote: number

        constructor() {
            this._selectedAnswer = 'null';
            this._text = 'null';
            this._upvote = -1;
        }

        public set selectedAnswer(selectedAnswer: string) {
            this._selectedAnswer = selectedAnswer;
        }

        public set text(text: string) {
            this._text = text;
        }

        public set upvote(upvote: number) {
            this._upvote = upvote;
        }

        build(number: number, questionNumber: number, questionExam: string): Discussion {
            return new Discussion(number, questionNumber, questionExam, this._selectedAnswer, this._text, this._upvote);
        }

    }

    public static async create(page: Page, questionNumber: number, questionExam: string): Promise<Discussion[]> {
        let list: Discussion[] = [];
        const discussionsElement = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2])')
        const discussionsChildNodesLength = await discussionsElement?.evaluate(el => el.childElementCount);
        if (discussionsChildNodesLength !== undefined) {
            for (let i = 1; i <= discussionsChildNodesLength; i++) {
                const discusstionElement = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[' + i + ']/div/div[2])');
                const obj = await discusstionElement?.evaluate(async el => {
                    async function nodeRecursion(el: Element | ChildNode, object: any) {
                        // @ts-ignore
                        if (el.className !== 'comment-replies' && el.hasChildNodes()) {
                            for (let i = 0; i < el.childNodes.length; i++) {
                                await nodeRecursion(el.childNodes[i], object);
                            }
                        }
                        // @ts-ignore
                        if (el.className === 'comment-selected-answers badge badge-warning') {
                            // console.log(el.textContent?.trim());
                            // array.push(el.textContent?.trim());
                            object.selectedAnswer = el.textContent?.trim() ?? 'null';
                        }
                        // @ts-ignore
                        else if (el.className === 'comment-content') {
                            // console.log(el.textContent?.trim());
                            // array.push(el.textContent?.trim());
                            object.text = el.textContent?.trim() ?? 'null';
                        }
                        // @ts-ignore
                        else if (el.className === 'ml-2 upvote-text') {
                            // console.log(el.textContent?.trim());
                            // array.push(el.textContent?.trim());
                            let upvoteText = el.textContent?.trim();
                            let upvote = Number(upvoteText?.split(' ')[1]);
                            object.upvote = upvote;
                        }
                    }

                    let object = {
                        selectedAnswer: 'null',
                        text: 'null',
                        upvote: -1
                    };

                    await nodeRecursion(el, object);
                    return object;
                });
                // console.log(obj);
                let discussion = new Discussion(i, questionNumber, questionExam, obj?.selectedAnswer ?? 'null', obj?.text ?? 'null', obj?.upvote ?? -1);
                list.push(discussion);
            }
        }
        return list;
    }

    public static async insert(discussion: Discussion) {
        const query = `
INSERT INTO discussions
    (number, question_number, question_exam, selected_answer, text, upvote)
VALUES ($1, $2, $3, $4, $5, $6);
`;

        const values = [
            discussion.number,
            discussion.questionNumber,
            discussion.questionExam,
            discussion.selectedAnswer,
            discussion.text,
            discussion.upvote
        ];

        const result = await DatabaseManager.executeQuery(query, values);
        console.log(result);
    }
}

// What is the order of the SQL Files loaded?
// 1) scrapeData()'s       Question, Answers, Answers     uses docker_pg_schema.sql

// I think no need to increment after using scrapeData(), because this function is mostly just to test a single page
// No need docker_pg_seq_schema.sql

// The function docker not involve scraper sql
// No need docker_pg_scraper.sql
// No need docker_pg_seq_scraper.sql 

// There are dependencies for this function, need to run SQL in this order
// 2) (This functions does need scraping the questions link first)
// 3) docker_pg_schema.sql
// 4) docker_pg_seq_schema.sql
// 5) Run scrapeData()

let scrapeData = async () => {
    console.log("Starting test");
    
    const scrapeDataLambda = async (page: Page, i: number) => {
        try {
            console.log("Page loaded");
            await page.locator('.popup-overlay.show').wait();
            console.log("Popup detected");

            // Apparently page.evaluate is like opening up console
            await page.evaluate(() => {
                const el = document.querySelector('.popup-overlay.show');
                if (el) {
                    el.className = 'popup-overla show';
                }
            });
        } catch (error) {
            console.log("Popup not detected");
        }

        try {
            await page.locator('.load-full-discussion-button').wait();
            console.log("Load Discussions button detected");
            await page.locator('.load-full-discussion-button').click();
            console.log("clicked load Discussions button");
        } catch (error) {
            console.log("Load Discussions button not detected");
        }

        console.log('\n');

        // Question
        let question = await Question.create(page, i, '1z0-071');
        console.log(question);

        console.log('\n');

        // Answers
        let answers = await Answer.create(page, i, '1z0-071');
        console.log(answers);

        console.log('\n');

        // Discussions
        // The xpath is dynamic, can only be determined by el.className
        // /html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2]/div[1]
        // /html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2]/div[2] 

        let discussions = await Discussion.create(page, i, '1z0-071');
        console.log(discussions);

        console.log('\n');
    }

    await BrowserManager.manageBrowserAndPageOverload("http://127.0.0.1:9222",
        'https://www.examtopics.com/discussions/oracle/view/79530-exam-1z0-071-topic-1-question-2-discussion/',
        1,
        scrapeDataLambda);

    console.log('Ending Test');
}

let main3 = async () => {
    console.log("Starting test");
    let google = 'https://www.google.com/';
    let googleSearch = 'examtopics 1z0-"071" Exam question 1';
    // const browser = await puppeteer.launch({ headless: false }); // show browser

    const browserURL = 'http://127.0.0.1:9222';  // Remote debugging address
    const browser = await puppeteer.connect({ browserURL });

    const page = await browser.newPage();
    // Needs { waitUntil: 'networkidle2' } to make thread continue

    await page.goto(google, { waitUntil: 'networkidle2' });

    await page.locator('.gLFyf').wait();
    console.log("Google search input detected");
    await page.locator('.gLFyf').fill(googleSearch);
    console.log("Input Google search input");

    page.keyboard.press('Enter');
    console.log("Clicked enter");

    // await page.locator('.gNO89b').wait();
    // console.log("Google search button detected");
    // await page.locator('.gNO89b').click();
    // console.log("clicked Google search button");

    const element = await page.waitForSelector('::-p-xpath(/html/body/div[3]/div/div[12]/div/div[2]/div[2]/div/div/div[1]/div/div/div/div[1]/div/div/span/a)');
    // @ts-ignore
    const link = await element?.evaluate(el => el.href);
    console.log(link);
    // browser.disconnect();
    browser.close();
}

function randomDelay(min: number, max: number) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

// What is the order of the SQL Files loaded?
// 1) scrapeWebsiteLinksIntoPostgres()'s       result                         uses docker_pg_seq_scraper.sql
// 2) scrapeWebsiteLinksIntoPostgres()'s       insertResult                   uses docker_pg_scraper.sql

// There are dependencies for this function, need to run SQL in this order
// 1) docker_pg_scraper.sql
// 2) docker_pg_seq_scraper.sql
// 3) Run scrapeWebsiteLinksIntoPostgres()

let scrapeWebsiteLinksIntoPostgres = async () => {
    console.log("Starting test");

    const scrapeDataLambda = async (page: Page, i: number) => {
        let googleSearch = 'examtopics 1z0-"071" Exam question ' + i;
        await page.locator('.gLFyf').wait();
        console.log("Google search input detected");
        await page.locator('.gLFyf').fill(googleSearch);
        console.log("Input Google search input");

        page.keyboard.press('Enter');
        console.log("Clicked enter");

        const element = await page.waitForSelector('::-p-xpath(/html/body/div[3]/div/div[12]/div/div[2]/div[2]/div/div/div[1]/div/div/div/div[1]/div/div/span/a)');
        // @ts-ignore
        const link = await element?.evaluate(el => el.href);
        console.log(link);

        const insertResult = await DatabaseManager.executeQuery(`INSERT INTO questionsLink (number, exam, link) 
VALUES ((SELECT last_value FROM seq_questionsLink), '1z0-071', '${link}');`);
        console.log(insertResult);
    }

    // Below is seq_questionsLink instead of seq_questions, this is fine
    const result = await DatabaseManager.executeQuery("SELECT last_value FROM seq_questionsLink;");
    let sequenceLastValue: number = result.rows[0].last_value;

    for (let i = sequenceLastValue; i <= 272;) {
        await BrowserManager.manageBrowserAndPageOverload("http://127.0.0.1:9222", 'https://www.google.com/', i, scrapeDataLambda);

        // Increment
        // Below is seq_questionsLink instead of seq_questions, this is fine 
        const result = await DatabaseManager.executeQuery("SELECT nextval('seq_questionsLink') as next_value;");
        let sequenceLastValue: number = result.rows[0].next_value;
        i = sequenceLastValue;

        // Wait random time between 1min–1min30s
        const delay = randomDelay(63000, 70000);
        console.log(`Waiting ${delay / 1000}s...`)
        await new Promise(resolve => setTimeout(resolve, delay));
    }
}

let scrapeDataIntoPostgres = async () => {
    console.log("Starting test");

    // same lambda()
    const scrapeDataLambda = async (page: Page, i: number) => {
        try {
            console.log("Page loaded");
            await page.locator('.popup-overlay.show').wait();
            console.log("Popup detected");

            // Apparently page.evaluate is like opening up console
            await page.evaluate(() => {
                const el = document.querySelector('.popup-overlay.show');
                if (el) {
                    el.className = 'popup-overla show';
                }
            });
        } catch (error) {
            console.log("Popup not detected");
        }

        try {
            await page.locator('.load-full-discussion-button').wait();
            console.log("Load Discussions button detected");
            await page.locator('.load-full-discussion-button').click();
            console.log("clicked load Discussions button");
            // Wait for load discussion to finish
            await new Promise(resolve => setTimeout(resolve, 5000));
        } catch (error) {
            console.log("Load Discussions button not detected");
        }

        // Question
        let question = await Question.create(page, i, '1z0-071');
        console.log(question);
        await Question.insert(question);

        // Answers
        let answers = []
        try {
            answers = await Answer.create(page, i, '1z0-071');
        } catch (error) {
            console.log("cannot find answers")
            answers = await Answer.newCreate(page, i, '1z0-071');
        }

        for (let i = 0; i < answers.length; i++) {
            console.log(answers[i]);
            await Answer.insert(answers[i]);
        }

        // Discussions
        let discussions = await Discussion.create(page, i, '1z0-071');
        for (let i = 0; i < discussions.length; i++) {
            console.log(discussions[i]);
            await Discussion.insert(discussions[i]);
        }
    }

    // same lambda()
    const result = await DatabaseManager.executeQuery("SELECT last_value FROM seq_questions;")
    let sequenceLastValue: number = result.rows[0].last_value;
    await BrowserManager.manageBrowserAndPage("http://127.0.0.1:9222", sequenceLastValue, scrapeDataLambda);
}

let rescrapeDataDebug = async () => {
    const scrapeDataLambda = async (page: Page, questionsnumber: number) => {
        try {
            console.log("Page loaded");
            await page.locator('.popup-overlay.show').wait();
            console.log("Popup detected");

            // Apparently page.evaluate is like opening up console
            await page.evaluate(() => {
                const el = document.querySelector('.popup-overlay.show');
                if (el) {
                    el.className = 'popup-overla show';
                }
            });
        } catch (error) {
            console.log("Popup not detected");
        }

        try {
            await page.locator('.load-full-discussion-button').wait();
            console.log("Load Discussions button detected");
            await page.locator('.load-full-discussion-button').click();
            console.log("clicked load Discussions button");
            // Wait for load discussion to finish
            await new Promise(resolve => setTimeout(resolve, 5000));
        } catch (error) {
            console.log("Load Discussions button not detected");
        }

        // Answers
        let answers = []
        try {
            answers = await Answer.create(page, questionsnumber, '1z0-071');
        } catch (error) {
            console.log("cannot find answers")
            answers = await Answer.newCreate(page, questionsnumber, '1z0-071');
        }

        for (let i = 0; i < answers.length; i++) {
            console.log(answers[i]);
            await Answer.merge(answers[i]);
        }
    }

    // Below looks like a totally different query
    const result = await DatabaseManager.executeQuery("select number, link from missing_answers_link;")

    for (let i = 0; i < (result.rowCount ?? 0); i++) {
        const questionsNumber = result.rows[i].number
        const questionsLink = result.rows[i].link
        await BrowserManager.manageBrowserAndPageOverload('http://127.0.0.1:9222', questionsLink, questionsNumber, scrapeDataLambda);
    }
}

let scrapeImages = async () => {

    const result = await DatabaseManager.executeQuery("SELECT last_value FROM seq_imagesLink;")
    let sequenceLastValue: number = result.rows[0].last_value;

    // The code below is uniquie to the below function
    for (let i = sequenceLastValue; i <= 57;) {
        const imageslinkResult = await DatabaseManager.executeQuery(`SELECT url FROM view_all_images_url where number = ${i};`)
        const imageslink: string = imageslinkResult.rows[0].url;

        const filename = imageslink.substring(imageslink.lastIndexOf("/") + 1, imageslink.length);
        console.log(filename);

        const response = await fetch(imageslink);
        if (!response.ok) {
            throw new Error(`Failed to fetch ${imageslink}: ${response.statusText}`);
        }

        const arrayBuffer = await response.arrayBuffer();
        fs.writeFileSync("./images/" + filename, Buffer.from(arrayBuffer));

        console.log("Image saved as " + filename);

        // Increment 
        const result = await DatabaseManager.executeQuery("SELECT nextval('seq_imagesLink') as next_value;")
        let sequenceLastValue: number = result.rows[0].next_value;
        i = sequenceLastValue;

        // Wait random time between 1min–1min30s
        const delay = randomDelay(3000, 10000);
        console.log(`Waiting ${delay / 1000}s...`)
        await new Promise(resolve => setTimeout(resolve, delay));
    }

}

class Markdown {
    private questionNumber: number
    private question: string
    private answers: string[]
    private discussions: string[]
    constructor(questionNumber: number, question: string, answers: string[], discussions: string[]) {
        this.questionNumber = questionNumber;
        this.question = question; // string is immutable
        this.answers = Array.from(answers); // clone to prevent external modification
        this.discussions = Array.from(discussions); // clone to prevent external modification
    }

    public toString(): string {
        let discussionsString = "";
        for (let i = 0; i < this.discussions.length; i++) {
            discussionsString += "## Discussion " + (i + 1) + "\n" +
                this.discussions[i] + "\n\n";
        }

        return "# Question " + this.questionNumber + "\n" +
            this.question + "\n\n" +
            "# Answers\n" +
            this.answers.join("\n\n") + "\n\n" +
            "# Discussions\n" +
            discussionsString;
    }

    public toFile(): void {
        fs.writeFileSync("./markdowns/question" + this.questionNumber + ".md", this.toString());
        console.log("Question, Answers, Discussions saved as " + this.questionNumber + ".md");
    }
}

let markdown = async () => {
    const result = await DatabaseManager.executeQuery("SELECT last_value FROM seq_markdown;")
    let sequenceLastValue: number = result.rows[0].last_value;

    for (let i = sequenceLastValue; i <= 272;) {
        const questionResult = await DatabaseManager.executeQuery(`select questions.number , questions.text
from relative_path_questions as questions
where questions.number = ${i};`);
        const question: string = questionResult.rows[0].text;

        const answerResult = await DatabaseManager.executeQuery(`select REPLACE(answers.text, 'Most Voted', '') as text, answers.is_correct
from relative_path_questions as questions
join relative_path_answers as answers 
on answers.question_number = questions.number and
answers.question_exam = questions.exam
where questions.number = ${i}
order by text`);
        let answerCount = answerResult.rowCount;
        let answers: string[] = [];
        for (let i = 0; i < (answerCount ?? 0); i++) {
            let answer = answerResult.rows[i].text;
            answers.push(answer);
        }

        const discussionResult = await DatabaseManager.executeQuery(`select discussions.selected_answer, discussions.text, discussions.upvote
from relative_path_questions as questions
join discussions
on discussions.question_number = questions.number and
discussions.question_exam = questions.exam
where questions.number = ${i}
order by upvote desc
limit 5;`);

        let discussionCount = discussionResult.rowCount;
        let discussions: string[] = [];
        for (let i = 0; i < (discussionCount ?? 0); i++) {
            let discussion = discussionResult.rows[i].text;
            discussions.push(discussion);
        }

        let markdown = new Markdown(i, question, answers, discussions);
        markdown.toFile();

        // Increment 
        const result = await DatabaseManager.executeQuery("SELECT nextval('seq_markdown') as next_value;")
        let sequenceLastValue: number = result.rows[0].next_value;
        i = sequenceLastValue;
    }

}

// markdown()
// scrapeImages()
// scrapeWebsiteLinksIntoPostgres()
//main3()
// scrapeData()
// scrapeDataIntoPostgres()
//main()ts

// rescrapeDataDebug()

BrowserManager.lambda();