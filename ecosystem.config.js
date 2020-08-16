// Monggo DB connection sctring
const dbConnection = "localhost/open-weeb-repo";
// Rabbit MQ connection
const rabbitMqConnection = "amqp://localhost";
// Scrap seasonal page cron
const tempestCronTime = "0 0 0 * * 0";
// get project cron
const rimuruCronTime = "0 0 12 * * *";

module.exports = {
  apps : [{
    name: "diablo",
    script: 'diablo',
    cwd: "./diablo",
    env: {
      "DB_CONN":dbConnection,
      "QUEUE_CONN": rabbitMqConnection
    }
  },{
    name: "tempest",
    script: "tempest",
    cwd: "./tempest",
    args: "start",
    env: {
      "DB_CONN":dbConnection,
      "APP_CRONTIME": tempestCronTime
    }
  },{
    name: "rimuru",
    script: "rimuru",
    cwd: "./rimuru",
    args: "start",
    env: {
      "DB_CONN":dbConnection,
      "QUEUE_CONN": rabbitMqConnection,
      "APP_CRONTIME": rimuruCronTime
    }
  }],
};
