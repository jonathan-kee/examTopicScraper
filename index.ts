import duckdb from '@duckdb/node-api';

let main = async () => {
    console.log(duckdb.version());
    console.log(duckdb.configurationOptionDescriptions());
}

main()