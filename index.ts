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


let main2 = async () => {
    console.log("Starting test");
    const browser = await puppeteer.launch({ headless: false }); // show browser
    const page = await browser.newPage();
    // Needs { waitUntil: 'networkidle2' } to make thread continue
    await page.goto('https://www.examtopics.com/discussions/oracle/view/79888-exam-1z0-071-topic-1-question-1-discussion/', { waitUntil: 'networkidle2' });

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
    const questionsChildNodesLengh = await questionsElement?.evaluate(el => el.childNodes.length);
    if (questionsChildNodesLengh !== undefined) {
        for (let i = 1; i <= questionsChildNodesLengh; i++) {
            const element = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[1]/div[2]/div[2]/ul/li['+i+'])');
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

    await browser.close();
}
main2()
//main()ts
