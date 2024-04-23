import { PrismaClient } from "@prisma/client";

export const prisma = new PrismaClient();

export default async function getProjects(req, res) {
  const projects = await prisma.projeto.findMany({
    include: {
      Atividade: true,
    },
  });
  res.json(projects);
}
