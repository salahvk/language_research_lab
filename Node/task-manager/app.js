const connectDB = require("./db/connect");
const express = require("express");
const app = express();
const tasks = require("./routes/tasks");
require('dotenv').config()

// middleware
app.use(express.json());

app.get("/hello", (req, res) => {
  res.send("Hi salah");
});

app.use("/api/v1/tasks", tasks);

const port = 3000;
const start = async () => {
  try {
    await connectDB(process.env.MONGO_URI);
    app.listen(port, console.log(`Server is listening on port ${port}..`));
  } catch (error) {
    console.log(error);
  }
};

start();
