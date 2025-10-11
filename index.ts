import fs from "fs";

import { DuckDBInstance } from '@duckdb/node-api';
import puppeteer, { Page } from 'puppeteer';
import { Client } from 'pg'

let main = async () => {
    const instance = await DuckDBInstance.create(':memory:');
    const connection = await instance.connect();

    // Read SQL file
    const sql = fs.readFileSync("./schema.sql", "utf8");

    // Run SQL (can be multiple statements)
    await connection.run(sql);

    const result = await connection.run("select * from answers;");
    const columns = result.columnNames()
    const rows = await result.getRows();
    console.log(columns);
    console.log(rows);
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

    public static async insert(question: Question, client: Client) {
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

        const result = await client.query(query, values);
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

    public static async insert(answer: Answer, client: Client) {
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

        const result = await client.query(query, values);
        console.log(result);
    }

    public static async merge(answer: Answer, client: Client) {
        const query = `
MERGE INTO answers
USING (
SELECT $1 AS number, $2 AS question_number, $3 AS question_exam, $4 AS text, $5 AS is_correct
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

        const result = await client.query(query, values);
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

    public static async insert(discussion: Discussion, client: Client) {
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

        const result = await client.query(query, values);
        console.log(result);
    }
}

let scrapeData = async () => {
    console.log("Starting test");
    const browser = await puppeteer.launch({ headless: false }); // show browser
    const page = await browser.newPage();
    // Make waiting for elements shorter
    page.setDefaultTimeout(7000);

    // Needs { waitUntil: 'networkidle2' } to make thread continue
    await page.goto('https://www.examtopics.com/discussions/oracle/view/79530-exam-1z0-071-topic-1-question-2-discussion/', { waitUntil: 'networkidle2' });
    // await page.goto('https://www.examtopics.com/discussions/oracle/view/79530-exam-1z0-071-topic-1-question-2-discussion/', { waitUntil: 'networkidle2' });

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
    let question = await Question.create(page, 1, '1z0-071');
    console.log(question);

    console.log('\n');

    // Answers
    let answers = await Answer.create(page, 1, '1z0-071');
    console.log(answers);

    console.log('\n');

    // Discussions
    // The xpath is dynamic, can only be determined by el.className
    // /html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2]/div[1]
    // /html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2]/div[2] 

    let discussions = await Discussion.create(page, 1, '1z0-071');
    console.log(discussions);

    console.log('\n');

    console.log('Ending Test');

    await browser.close();
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

let scrapeWebsiteLinksIntoPostgres = async () => {
    console.log("Starting test");

    const client = new Client({
        user: 'postgres',
        password: 'abc123',
        host: 'localhost',
        port: 5432,
        database: 'examtopic',
    })

    await client.connect()

    const result = await client.query("SELECT last_value FROM seq_questionsLink;")
    let sequenceLastValue: number = result.rows[0].last_value;

    const google = 'https://www.google.com/';
    const browserURL = 'http://127.0.0.1:9222';  // Remote debugging address
    const browser = await puppeteer.connect({ browserURL });

    for (let i = sequenceLastValue; i <= 272;) {

        let googleSearch = 'examtopics 1z0-"071" Exam question ' + i;
        const page = await browser.newPage();
        // Needs { waitUntil: 'networkidle2' } to make thread continue

        await page.goto(google, { waitUntil: 'networkidle2' });

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

        const insertResult = await client.query(`INSERT INTO questionsLink (number, exam, link) 
VALUES ((SELECT last_value FROM seq_questionsLink), '1z0-071', '${link}');`)
        console.log(insertResult);

        page.close();

        // Increment 
        const result = await client.query("SELECT nextval('seq_questionsLink') as next_value;")
        let sequenceLastValue: number = result.rows[0].next_value;
        i = sequenceLastValue;

        // Wait random time between 1min–1min30s
        const delay = randomDelay(63000, 70000);
        console.log(`Waiting ${delay / 1000}s...`)
        await new Promise(resolve => setTimeout(resolve, delay));
    }

    await client.end();
    // browser.disconnect();
    await browser.close();
}

let scrapeDataIntoPostgres = async () => {
    console.log("Starting test");

    const client = new Client({
        user: 'postgres',
        password: 'abc123',
        host: 'localhost',
        port: 5432,
        database: 'examtopic',
    })

    await client.connect()

    const result = await client.query("SELECT last_value FROM seq_questions;")
    let sequenceLastValue: number = result.rows[0].last_value;
    const browserURL = 'http://127.0.0.1:9222';  // Remote debugging address
    const browser = await puppeteer.connect({ browserURL });

    for (let i = sequenceLastValue; i <= 272;) {

        const questionslinkResult = await client.query(`SELECT link FROM questionslink where number = ${i};`)
        const questionslink: string = questionslinkResult.rows[0].link;

        const page = await browser.newPage();
        // Needs { waitUntil: 'networkidle2' } to make thread continue
        // Make waiting for elements shorter
        page.setDefaultTimeout(12000);

        await page.goto(questionslink, { waitUntil: 'networkidle2' });

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
        await Question.insert(question, client);

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
            await Answer.insert(answers[i], client);
        }

        // Discussions
        let discussions = await Discussion.create(page, i, '1z0-071');
        for (let i = 0; i < discussions.length; i++) {
            console.log(discussions[i]);
            await Discussion.insert(discussions[i], client);
        }

        page.close();

        // Increment 
        const result = await client.query("SELECT nextval('seq_questions') as next_value;")
        let sequenceLastValue: number = result.rows[0].next_value;
        i = sequenceLastValue;

        // Wait random time between 1min–1min30s
        const delay = randomDelay(33000, 60000);
        console.log(`Waiting ${delay / 1000}s...`)
        await new Promise(resolve => setTimeout(resolve, delay));
    }

    await client.end();
    // browser.disconnect();
    await browser.close();
}

let rescrapeDataDebug = async () => {

    const client = new Client({
        user: 'postgres',
        password: 'abc123',
        host: 'localhost',
        port: 5432,
        database: 'examtopic',
    })

    await client.connect()

    const result = await client.query("select number, link from missing_answers_link;")

    const browserURL = 'http://127.0.0.1:9222';  // Remote debugging address
    const browser = await puppeteer.connect({ browserURL });

    for (let i = 0; i < (result.rowCount ?? 0); i++) {
        const questionsnumber = result.rows[i].number
        const questionslink = result.rows[i].link

        const page = await browser.newPage();
        // Needs { waitUntil: 'networkidle2' } to make thread continue
        // Make waiting for elements shorter
        page.setDefaultTimeout(12000);

        await page.goto(questionslink, { waitUntil: 'networkidle2' });

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
            Answer.merge(answers[i], client);
        }

        page.close();
    }

    await client.end();
    // browser.disconnect();
    await browser.close();
}

let scrapeImages = async () => {
    const client = new Client({
        user: 'postgres',
        password: 'abc123',
        host: 'localhost',
        port: 5432,
        database: 'examtopic',
    })

    await client.connect()

    const result = await client.query("SELECT last_value FROM seq_imagesLink;")
    let sequenceLastValue: number = result.rows[0].last_value;

    for (let i = sequenceLastValue; i <= 178;) {
        const imageslinkResult = await client.query(`SELECT url FROM view_all_images_url where number = ${i};`)
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
        const result = await client.query("SELECT nextval('seq_imagesLink') as next_value;")
        let sequenceLastValue: number = result.rows[0].next_value;
        i = sequenceLastValue;

        // Wait random time between 1min–1min30s
        const delay = randomDelay(3000, 10000);
        console.log(`Waiting ${delay / 1000}s...`)
        await new Promise(resolve => setTimeout(resolve, delay));
    }

    await client.end();
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
    const client = new Client({
        user: 'postgres',
        password: 'abc123',
        host: 'localhost',
        port: 5432,
        database: 'examtopic',
    })

    await client.connect()

    const result = await client.query("SELECT last_value FROM seq_markdown;")
    let sequenceLastValue: number = result.rows[0].last_value;

    for (let i = sequenceLastValue; i <= 272;) {
        const questionResult = await client.query(`select questions.number , questions.text
from relative_path_questions as questions
where questions.number = ${i};`);
        const question: string = questionResult.rows[0].text;

        const answerResult = await client.query(`select REPLACE(answers.text, 'Most Voted', '') as text, answers.is_correct
from relative_path_questions as questions
join relative_path_answers as answers 
on answers.question_number = questions.number and
answers.question_exam = questions.exam
where questions.number = ${i};`);
        let answerCount = answerResult.rowCount;
        let answers: string[] = [];
        for (let i = 0; i < (answerCount ?? 0); i++) {
            let answer = answerResult.rows[i].text;
            answers.push(answer);
        }

        const discussionResult = await client.query(`select discussions.selected_answer, discussions.text, discussions.upvote
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
        const result = await client.query("SELECT nextval('seq_markdown') as next_value;")
        let sequenceLastValue: number = result.rows[0].next_value;
        i = sequenceLastValue;
    }

    await client.end();
}


// markdown()
// scrapeImages()
// scrapeWebsiteLinksIntoPostgres()
//main3()
// scrapeData()
// scrapeDataIntoPostgres()
//main()ts

rescrapeDataDebug()