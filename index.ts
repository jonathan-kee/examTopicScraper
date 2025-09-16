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
}

class Exam {
    private _name: string
    private _company: string
    public constructor(name: string, company: string) {
        this._name = name;
        this._company = company;
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

    public static async create(page: Page, questionNumber: number, questionExam: string): Promise<Answer[]> {
        let list:Answer[] = [];
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
                
                let answerObj = new Answer(i, questionNumber, questionExam, answer ?? 'null', true); // true for now
                list.push(answerObj);
            }
        }
        return list;
    }
}

let main2 = async () => {
    console.log("Starting test");
    const browser = await puppeteer.launch({ headless: false }); // show browser
    const page = await browser.newPage();
    // Needs { waitUntil: 'networkidle2' } to make thread continue

    await page.goto('https://www.examtopics.com/discussions/oracle/view/79888-exam-1z0-071-topic-1-question-1-discussion/', { waitUntil: 'networkidle2' });
    // await page.goto('https://www.examtopics.com/discussions/oracle/view/79530-exam-1z0-071-topic-1-question-2-discussion/', { waitUntil: 'networkidle2' });

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

    await page.locator('.load-full-discussion-button').wait();
    console.log("Load Discussions button detected");
    await page.locator('.load-full-discussion-button').click();
    console.log("clicked load Discussions button");

    console.log('\n');

    // Question
    const element2 = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[1]/div[2]/p)');
    let arrayOfText = await element2?.evaluate(el => {
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

    console.log('\n');

    // Answers
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
            console.log('\n');
        }
    }

    // Discussions
    // The xpath is dynamic, can only be determined by el.className
    // /html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2]/div[1]
    // /html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2]/div[2] 


    const discussionsElement = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2])')
    const discussionsChildNodesLength = await discussionsElement?.evaluate(el => el.childElementCount);
    if (discussionsChildNodesLength !== undefined) {
        for (let i = 1; i <= discussionsChildNodesLength; i++) {
            const discusstionElement = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[' + i + ']/div/div[2])');
            const text = await discusstionElement?.evaluate(async el => {
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

                let array: any[] = [];
                await nodeRecursion(el, array);
                return array;
            });
            console.log(text);
        }
    }

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

    // browser.disconnect();
    browser.close();
}

main4()
//main3()
// main2()
//main()ts
