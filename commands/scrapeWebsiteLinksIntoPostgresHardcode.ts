import {Page} from 'puppeteer';
import * as browser from '../modules/browser/index.js'
import * as db from '../modules/db/index.js'

function randomDelay(min: number, max: number) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

let scrapeWebsiteLinksIntoPostgresHardcode = async () => {
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

        const insertResult = await db.DatabaseManager.executeQuery(`INSERT INTO questionsLink (number, exam, link) 
VALUES ('${i}', '1z0-071', '${link}');`);
        console.log(insertResult);
    }

    // Below is seq_questionsLink instead of seq_questions, this is fine
    let sequenceLastValue: number = 41;

    for (let i = sequenceLastValue; i <= 73; i++) {
        // I will open and close the browser which is not what I wanted
        await browser.BrowserManager.manageBrowserAndPageOverload("http://127.0.0.1:9222", 'https://www.google.com/', i, scrapeDataLambda);

        // Wait random time between 1min–1min30s
        const delay = randomDelay(61000, 65000);
        console.log(`Waiting ${delay / 1000}s...`)
        await new Promise(resolve => setTimeout(resolve, delay));
    }
}

scrapeWebsiteLinksIntoPostgresHardcode()