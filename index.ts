import fs from "fs";
import puppeteer, { Browser, Page, PuppeteerError, TimeoutError } from 'puppeteer';
import * as db from './modules/db/index.js'
import * as s3 from './modules/s3/index.js'
import * as schema from './modules/schema/index.js'
import * as browser from './modules/browser/index.js'
import * as presentation from './modules/presentation/index.js'

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
        let question = await schema.Question.create(page, i, '1z0-071');
        console.log(question);

        console.log('\n');

        // Answers
        let answers = await schema.Answer.create(page, i, '1z0-071');
        console.log(answers);

        console.log('\n');

        // Discussions
        // The xpath is dynamic, can only be determined by el.className
        // /html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2]/div[1]
        // /html/body/div[2]/div/div[4]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/div[2]/div[2] 

        let discussions = await schema.Discussion.create(page, i, '1z0-071');
        console.log(discussions);

        console.log('\n');
    }

    await browser.BrowserManager.manageBrowserAndPageOverload("http://127.0.0.1:9222",
        'https://www.examtopics.com/discussions/oracle/view/79530-exam-1z0-071-topic-1-question-2-discussion/',
        1,
        scrapeDataLambda);

    console.log('Ending Test');
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

        const insertResult = await db.DatabaseManager.executeQuery(`INSERT INTO questionsLink (number, exam, link) 
VALUES ((SELECT last_value FROM seq_questionsLink), '1z0-071', '${link}');`);
        console.log(insertResult);
    }

    // Below is seq_questionsLink instead of seq_questions, this is fine
    const result = await db.DatabaseManager.executeQuery("SELECT last_value FROM seq_questionsLink;");
    let sequenceLastValue: number = result.rows[0].last_value;

    for (let i = sequenceLastValue; i <= 272;) {
        // I will open and close the browser which is not what I wanted
        await browser.BrowserManager.manageBrowserAndPageOverload("http://127.0.0.1:9222", 'https://www.google.com/', i, scrapeDataLambda);

        // Increment
        // Below is seq_questionsLink instead of seq_questions, this is fine 
        const result = await db.DatabaseManager.executeQuery("SELECT nextval('seq_questionsLink') as next_value;");
        let sequenceLastValue: number = result.rows[0].next_value;
        i = sequenceLastValue;

        // Wait random time between 1min–1min30s
        const delay = randomDelay(61000, 65000);
        console.log(`Waiting ${delay / 1000}s...`)
        await new Promise(resolve => setTimeout(resolve, delay));
    }
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

// What is the order of the SQL Files loaded?
// 1) scrapeDataIntoPostgres()'s       result                         uses docker_pg_seq_schema.sql
// 2) scrapeDataIntoPostgres()'s       Question, Answers, Answers     uses docker_pg_schema.sql
// 3) reusepage()'s                    questionslink                  uses docker_pg_scraper.sql
// 4) reusepage()'s                    increment                      uses docker_pg_seq_schema.sql

// There are dependencies for this function, need to run SQL in this order
// 1) docker_pg_scraper.sql
// 2) docker_pg_seq_scraper.sql
// 3) Scrape the questions link first.
// 4) docker_pg_schema.sql
// 5) docker_pg_seq_schema.sql
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
        let question = await schema.Question.create(page, i, '1z0-071');
        console.log(question);
        await schema.Question.insert(question);

        // Answers
        let answers = []
        try {
            answers = await schema.Answer.create(page, i, '1z0-071');
        } catch (error) {
            console.log("cannot find answers")
            answers = await schema.Answer.newCreate(page, i, '1z0-071');
        }

        for (let i = 0; i < answers.length; i++) {
            console.log(answers[i]);
            await schema.Answer.insert(answers[i]);
        }

        // Discussions
        let discussions = await schema.Discussion.create(page, i, '1z0-071');
        for (let i = 0; i < discussions.length; i++) {
            console.log(discussions[i]);
            await schema.Discussion.insert(discussions[i]);
        }
    }

    // same lambda()
    const result = await db.DatabaseManager.executeQuery("SELECT last_value FROM seq_questions;")
    let sequenceLastValue: number = result.rows[0].last_value;
    await browser.BrowserManager.manageBrowserAndPage("http://127.0.0.1:9222", sequenceLastValue, scrapeDataLambda);
}

// There are dependencies for this function, need to run SQL in this order:
// 1) docker_pg_findMissingAnswers.sql
// 2) docker_pg_schema.sql
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
            answers = await schema.Answer.create(page, questionsnumber, '1z0-071');
        } catch (error) {
            console.log("cannot find answers")
            answers = await schema.Answer.newCreate(page, questionsnumber, '1z0-071');
        }

        for (let i = 0; i < answers.length; i++) {
            console.log(answers[i]);
            await schema.Answer.merge(answers[i]);
        }
    }

    const result = await db.DatabaseManager.executeQuery("select number, link from missing_answers_link;")

    for (let i = 0; i < (result.rowCount ?? 0); i++) {
        const questionsNumber = result.rows[i].number
        const questionsLink = result.rows[i].link
        await browser.BrowserManager.manageBrowserAndPageOverload('http://127.0.0.1:9222', questionsLink, questionsNumber, scrapeDataLambda);
    }
}

// There are dependencies for this function, need to run SQL in this order:
// 1) docker_pg_seq_scrapeImage.sql
// 2) docker_pg_scrapeImage.sql
let scrapeImages = async () => {

    const result = await db.DatabaseManager.executeQuery("SELECT last_value FROM seq_imagesLink;")
    let sequenceLastValue: number = result.rows[0].last_value;

    // The code below is uniquie to the below function
    for (let i = sequenceLastValue; i <= 235;) {
        const imageslinkResult = await db.DatabaseManager.executeQuery(`SELECT url FROM all_images_url where number = ${i};`)
        const imageslink: string = imageslinkResult.rows[0].url;

        const filename = imageslink.substring(imageslink.lastIndexOf("/") + 1, imageslink.length);
        console.log(filename);

        const response = await fetch(imageslink);
        if (!response.ok) {
            throw new Error(`Failed to fetch ${imageslink}: ${response.statusText}`);
        }

        const arrayBuffer = await response.arrayBuffer();
        fs.writeFileSync("./images2/" + filename, Buffer.from(arrayBuffer));

        console.log("Image saved as " + filename);

        // Increment 
        const result = await db.DatabaseManager.executeQuery("SELECT nextval('seq_imagesLink') as next_value;")
        let sequenceLastValue: number = result.rows[0].next_value;
        i = sequenceLastValue;

        // Wait random time between 1min–1min30s
        const delay = randomDelay(3000, 10000);
        console.log(`Waiting ${delay / 1000}s...`)
        await new Promise(resolve => setTimeout(resolve, delay));
    }

}

// There are dependencies for this function, need to run SQL in this order:
// 1) docker_pg_cleanImages.sql (Creates relative_path_questions, relative_path_answers)
// 2) docker_pg_seq_format_markdown.sql

let markdown = async () => {
    const result = await db.DatabaseManager.executeQuery("SELECT last_value FROM seq_markdown;")
    let sequenceLastValue: number = result.rows[0].last_value;

    for (let i = sequenceLastValue; i <= 272;) {
        const questionResult = await db.DatabaseManager.executeQuery(`select questions.number , questions.text
from relative_path_questions as questions
where questions.number = ${i};`);
        const question: string = questionResult.rows[0].text;

        const answerResult = await db.DatabaseManager.executeQuery(`select REPLACE(answers.text, 'Most Voted', '') as text, answers.is_correct
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

        const discussionResult = await db.DatabaseManager.executeQuery(`select discussions.selected_answer, discussions.text, discussions.upvote
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

        let markdown = new presentation.Markdown(i, question, answers, discussions);
        markdown.toFile();

        // Increment 
        const result = await db.DatabaseManager.executeQuery("SELECT nextval('seq_markdown') as next_value;")
        let sequenceLastValue: number = result.rows[0].next_value;
        i = sequenceLastValue;
    }

}

// 1)
// scrapeWebsiteLinksIntoPostgres()

// 2)
// Missing website links 41 to 73
// scrapeWebsiteLinksIntoPostgresHardcode()

// 3)
// scrapeDataIntoPostgres()

// 4)
// Need to run in DataGrip
// docker_pg_scrapeImageTable.sql
// docker_pg_seq_scrapeImage.sql
// scrapeImages()

// 5)
// markdown()

// s3.createBucket("bucket");
s3.uploadFile("bucket","question1","./document/TestDocument");