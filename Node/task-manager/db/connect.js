const connectionString =
  "mongodb+srv://salahkoyilandy:y_GguTcY8.Jb3.6@fcodecamp-nodejs-projec.opvbxo1.mongodb.net/TASK-MANAGER?retryWrites=true&w=majority&appName=FCodeCamp-Nodejs-Projects";

const mongoose = require("mongoose")

const connectDB = (url) => {
 return mongoose.connect(url);
};

module.exports = connectDB
