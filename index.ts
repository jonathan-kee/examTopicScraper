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
        let query = `INSERT INTO questions
    (number, exam, text)
VALUES
    (${question.number}, '${question.exam}', '${question.text}');`;

        const result = await client.query(query);
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
                        answer += el.childNodes[i].textContent?.trim()
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

    public static async insert(answer: Answer, client: Client) {
        let query = `INSERT INTO answers
    (number, question_number, question_exam, text, is_correct)
VALUES
    (${answer.number}, ${answer.questionNumber}, '${answer.questionExam}', '${answer.text}', ${answer.isCorrect});`

        const result = await client.query(query);
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
        let query = `INSERT INTO discussions
    (number, question_number, question_exam, selected_answer, text, upvote)
VALUES
    (${discussion.number}, ${discussion.questionNumber}, '${discussion.questionExam}', '${discussion.selectedAnswer}', '${discussion.text}', ${discussion.upvote});  `

        const result = await client.query(query);
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

let main4 = async () => {
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

    const google = 'https://www.google.com/';
    const browserURL = 'http://127.0.0.1:9222';  // Remote debugging address
    const browser = await puppeteer.connect({ browserURL });

    for (let i = sequenceLastValue; i <= 272;) {

        const questionslinkResult = await client.query(`SELECT link FROM questionslink where number = ${i};`)
        const questionslink: string = questionslinkResult.rows[0].link;

        const page = await browser.newPage();
        // Needs { waitUntil: 'networkidle2' } to make thread continue
        // Make waiting for elements shorter
        page.setDefaultTimeout(7000);

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
        } catch (error) {
            console.log("Load Discussions button not detected");
        }

        // Question
        let question = await Question.create(page, i, '1z0-071');
        console.log(question);
        await Question.insert(question, client);

        // Answers
        let answers = await Answer.create(page, i, '1z0-071');
        for (let i = 0; i < answers.length; i++) {
            console.log(answers[i]);
            await Answer.insert(answers[i],client);
        }

        // Discussions
        let discussions = await Discussion.create(page, i, '1z0-071');
        for (let i = 0; i < discussions.length; i++) {
            console.log(discussions[i]);
            await Discussion.insert(discussions[i],client);
        }

        page.close();

        // Increment 
        const result = await client.query("SELECT nextval('seq_questions') as next_value;")
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

// main4()
//main3()
// scrapeData()
scrapeDataIntoPostgres()
//main()ts
