import fs from "fs";
import * as db from '../modules/db/index.js'

function randomDelay(min: number, max: number) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
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

scrapeImages()