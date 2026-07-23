import fs from "fs";
import test from 'node:test';
import * as db from '../modules/db/index.js'

class DatabaseManager {
    /** Single source of truth for database operations */
    static async executeQuery<T>(query: string, params?: any[]) {
        const result = await db.query(query, params);
        return result;
    }
}

function randomDelay(min: number, max: number) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

async function captureAsset(number: number, url: string,) {
  // Fetch HTML/CSS/JS from target server
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Failed to fetch ${url}: ${response.statusText}`);
  }
  const data = await response.arrayBuffer(); // Get raw binary or text buffer
  fs.writeFileSync("./document/" + "Document" + number + ".html", Buffer.from(data));

  console.log("Document " + number + " saved");
}

test('test capture document from page', async t => {
    const result = await DatabaseManager.executeQuery("SELECT link FROM questionslink;");
    for (let i = 0; i < (result.rowCount ?? 0) ; i++){
        let link:string = result.rows[i].link;
        // +1 to make sure follow normal ordering
        await captureAsset(i+1,link);

        // Wait random time between 3sec–5sec
        const delay = randomDelay(3000, 5000);
        console.log(`Waiting ${delay / 1000}s...`)
        await new Promise(resolve => setTimeout(resolve, delay));
    }
})