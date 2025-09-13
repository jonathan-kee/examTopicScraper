import t from 'tap'
import puppeteer from 'puppeteer';

t.test('Launch the browser and open a new blank page', async t => {
    const browser = await puppeteer.launch({ headless: false }); // show browser
    const page = await browser.newPage();
    await page.goto('https://developer.chrome.com/');
    await browser.close();
})

