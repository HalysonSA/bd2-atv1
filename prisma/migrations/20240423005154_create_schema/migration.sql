-- CreateTable
CREATE TABLE "funcionarios" (
    "codigo" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "sexo" TEXT NOT NULL,
    "dtNasc" TIMESTAMP(3) NOT NULL,
    "salario" DOUBLE PRECISION NOT NULL,
    "supervisorId" INTEGER,
    "departamentoId" INTEGER,
    "funcionarioCodigo" INTEGER,

    CONSTRAINT "funcionarios_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "departamentos" (
    "codigo" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "sigla" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "gerenteId" INTEGER,
    "funcionarioCodigo" INTEGER,

    CONSTRAINT "departamentos_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "projetos" (
    "codigo" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "responsavelId" INTEGER,
    "departamentoId" INTEGER,
    "dataInicio" TIMESTAMP(3) NOT NULL,
    "dataFim" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "projetos_pkey" PRIMARY KEY ("codigo")
);

-- CreateTable
CREATE TABLE "atividades" (
    "codigo" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "projetoId" INTEGER,
    "dataInicio" TIMESTAMP(3) NOT NULL,
    "dataFim" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "atividades_pkey" PRIMARY KEY ("codigo")
);

-- CreateIndex
CREATE UNIQUE INDEX "departamentos_sigla_key" ON "departamentos"("sigla");

-- CreateIndex
CREATE UNIQUE INDEX "projetos_nome_key" ON "projetos"("nome");

-- AddForeignKey
ALTER TABLE "funcionarios" ADD CONSTRAINT "funcionarios_supervisorId_fkey" FOREIGN KEY ("supervisorId") REFERENCES "funcionarios"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "departamentos" ADD CONSTRAINT "departamentos_funcionarioCodigo_fkey" FOREIGN KEY ("funcionarioCodigo") REFERENCES "funcionarios"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_responsavelId_fkey" FOREIGN KEY ("responsavelId") REFERENCES "funcionarios"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_departamentoId_fkey" FOREIGN KEY ("departamentoId") REFERENCES "departamentos"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "atividades" ADD CONSTRAINT "atividades_projetoId_fkey" FOREIGN KEY ("projetoId") REFERENCES "projetos"("codigo") ON DELETE SET NULL ON UPDATE CASCADE;
