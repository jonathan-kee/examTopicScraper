import t from 'tap'
import puppeteer from 'puppeteer';

// t.test('Launch the browser and open a new blank page', async t => {
//     const browser = await puppeteer.launch({ headless: false }); // show browser
//     const page = await browser.newPage();
//     await page.goto('https://developer.chrome.com/');
//     await browser.close();
// })


t.test('Launch the browser and scrape data', async t => {
    t.comment("Starting test");
    const browser = await puppeteer.launch({ headless: false }); // show browser
    const page = await browser.newPage();
    await page.goto('https://www.examtopics.com/discussions/oracle/view/79888-exam-1z0-071-topic-1-question-1-discussion/');
    
    t.comment("Page loaded");
    await page.locator('.popup-overlay.show').wait();
    t.comment("Popup detected");

    // Apparently page.evaluate is like opening up console
    await page.evaluate(() => {
        const el = document.querySelector('.popup-overlay.show');
        if (el) {
            el.className = 'popup-overla show';
        }
    });

    const element = await page.waitForSelector('::-p-xpath(/html/body/div[2]/div/div[4]/div/div[1]/div[2]/div[2]/ul/li[1])');
    const text = await element?.evaluate(el => el.textContent.trim());
    t.comment(text);
    await browser.close();
})