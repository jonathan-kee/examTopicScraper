import fs from "fs";

import { DuckDBInstance } from '@duckdb/node-api';
import puppeteer from 'puppeteer';


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
    const questionsChildNodesLengh = await questionsElement?.evaluate(el => el.childElementCount);
    if (questionsChildNodesLengh !== undefined) {
        for (let i = 1; i <= questionsChildNodesLengh; i++) {
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

    const discusstionElement = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2])');
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

    console.log('Ending Test');

    await browser.close();
}
main2()
//main()ts
