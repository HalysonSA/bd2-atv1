import { PrismaClient } from "@prisma/client";

export const prisma = new PrismaClient();

export default async function updateLeader(req, res) {
  const { id, lider } = req.body;
  const updatedProject = await prisma.projeto.update({
    where: { id },
    data: {
      responsavelId: lider,
    },
  });
  res.json(updatedProject);
}
