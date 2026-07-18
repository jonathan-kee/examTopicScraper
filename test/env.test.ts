// Link to 
// https://nodejs.org/learn/command-line/how-to-read-environment-variables-from-nodejs#loading-env-files-programmatically-with-processloadenvfilepath
import { loadEnvFile } from 'node:process';
import t from 'tap'

t.test('test .env file', async t => {
    loadEnvFile('./.env');
    console.log(process.env.RDS_DB_NAME);
    console.log(process.env.RDS_USERNAME);
    console.log(process.env.RDS_PASSWORD);
    console.log(process.env.RDS_HOST);
    console.log(process.env.PORT);
} )