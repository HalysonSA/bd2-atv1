import express from "express";
import getProjects from "./tarefa-orm/list-projects.js";
import insertActivityInProject from "./tarefa-orm/Insert-activity-in-project.js";
const app = express();

app.get("/orm/projetos", (req, res) => {
  getProjects(req, res);
});

app.post("/orm/projetos/atividade", async (req, res) => {
  const activity = await insertActivityInProject();
  res.json(activity);
});

app.listen(3000, () => {
  console.log("Server is running on port 3000");
});
