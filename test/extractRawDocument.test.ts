import t from 'tap'
import fs from "fs";

async function captureAsset(url: string) {
  // Fetch HTML/CSS/JS from target server
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Failed to fetch ${url}: ${response.statusText}`);
  }
  const data = await response.arrayBuffer(); // Get raw binary or text buffer
  fs.writeFileSync("./document/" + "TestDocument", Buffer.from(data));

  console.log("Document saved");
}

t.test('test capture document from page', async t => {
    await captureAsset("https://www.examtopics.com/discussions/oracle/view/79888-exam-1z0-071-topic-1-question-1-discussion/");
})