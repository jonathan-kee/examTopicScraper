import fs from "fs";
import test from 'node:test';

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
    await captureAsset(1,"https://www.examtopics.com/discussions/oracle/view/79888-exam-1z0-071-topic-1-question-1-discussion/");
    await captureAsset(2,"https://www.examtopics.com/discussions/oracle/view/79530-exam-1z0-071-topic-1-question-2-discussion/"); 
    await captureAsset(3,"https://www.examtopics.com/discussions/oracle/view/82940-exam-1z0-071-topic-1-question-3-discussion/");
    await captureAsset(4,"https://www.examtopics.com/discussions/oracle/view/79642-exam-1z0-071-topic-1-question-4-discussion/");
    await captureAsset(5,"https://www.examtopics.com/discussions/oracle/view/79891-exam-1z0-071-topic-1-question-5-discussion/");
})