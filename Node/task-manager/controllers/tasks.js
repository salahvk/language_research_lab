const getAllTasks = (req, res) => {
  res.send("all tasks");
};

const getTask = (req, res) => {
  res.json({id:req.params.id});
};

const createTask = (req, res) => {
  res.send("create task");
};

const updateTask = (req, res) => {
  res.send("update task");
};

const deleteTask = (req, res) => {
  res.send("delete task");
};

module.exports = { getAllTasks, getTask, createTask, updateTask, deleteTask };
