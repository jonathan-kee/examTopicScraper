import fs from "fs";

import { DuckDBInstance } from '@duckdb/node-api';


let main = async () => {
    const instance = await DuckDBInstance.create(':memory:');
    const connection = await instance.connect();

    // Read SQL file
    const sql = fs.readFileSync("./schema.sql", "utf8");

    // Run SQL (can be multiple statements)
    await connection.run(sql);

    const result = await connection.run("select * from answers;");
    const columns = result.columnNames()
    const rows = await result.getRows();
    console.log(columns);
    console.log(rows);
}

main()