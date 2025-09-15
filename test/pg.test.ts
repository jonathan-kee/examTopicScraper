import t from 'tap'
import { Client } from 'pg'

t.test('connect, insert, end', async t => {
    const client = new Client({
        user: 'postgres',
        password: 'abc123',
        host: 'localhost',
        port: 5432,
        database: 'examtopic',
    })

    await client.connect()

    const result = await client.query(`INSERT INTO questionsLink (number, exam, link) 
VALUES (nextval('seq_questionsLink'), '1z0-071', 'https://www.examtopics.com/discussions/oracle/view/79888-exam-1z0-071-topic-1-question-1-discussion/');`)
    console.log(result)

    await client.end()
})

t.test('connect, sequence last value, end', async t => {
    const client = new Client({
        user: 'postgres',
        password: 'abc123',
        host: 'localhost',
        port: 5432,
        database: 'examtopic',
    })

    await client.connect()

    const result = await client.query("SELECT last_value FROM seq_questionsLink;")
    console.log(result.rows[0].last_value)
    

    await client.end()
})