import { PrismaClient } from "@prisma/client";

export const prisma = new PrismaClient();

export default async function insertActivityInProject() {
  const { descricao, dataInicio, dataFim, projetoId } = {
    descricao: "Tarefa qualquer",
    dataInicio: "2018-08-26T00:00:00.000Z",
    dataFim: "2018-09-30T00:00:00.000Z",
    projetoId: 17,
  };

  const activity = await prisma.atividade.create({
    data: {
      descricao,
      projetoId,
      dataInicio,
      dataFim,
    },
  });

  return activity;
}
