import http from 'http';
import PG from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const port = Number(process.env.port || 3001);

const { DB_USER, DB_PASS, DB_HOST, DB_PORT, DB_NAME } = process.env;

const client = new PG.Client(
  `postgres://${DB_USER}:${DB_PASS}@${DB_HOST}:${DB_PORT}/${DB_NAME}` 
);

let successfulConnection = false;

http.createServer(async (req, res) => {
  console.log(`Request: ${req.url}`);

  if (req.url === "/api") {
    client.connect()
      .then(() => { successfulConnection = true })
      .catch(err => console.error('Database not connected -', err.stack));

    res.setHeader("Content-Type", "application/json");
    res.writeHead(200);

    let result;

    try {
      result = (await client.query("SELECT * FROM users")).rows[0];
    } catch (error) {
      console.error(error)
    }

    const data = {
      database: successfulConnection,
      userAdmin: result?.role === "admin"
    }

    res.end(JSON.stringify(data));
  } else {
    res.writeHead(503);
    res.end("Internal Server Error");
  }

}).listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});