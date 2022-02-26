/*
  Warnings:

  - You are about to drop the `Marcas` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `agente` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "expedientes" DROP CONSTRAINT "expedientes_agente_id_fkey";

-- DropForeignKey
ALTER TABLE "expedientes" DROP CONSTRAINT "expedientes_marca_id_fkey";

-- DropForeignKey
ALTER TABLE "titulares" DROP CONSTRAINT "titulares_agente_id_fkey";

-- DropTable
DROP TABLE "Marcas";

-- DropTable
DROP TABLE "agente";

-- CreateTable
CREATE TABLE "agentes" (
    "id" SERIAL NOT NULL,
    "pais" "Paises" NOT NULL,
    "nombre" TEXT NOT NULL,
    "direccion" TEXT,

    CONSTRAINT "agentes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "marcas" (
    "id" SERIAL NOT NULL,
    "denominacion" TEXT,
    "logo" TEXT,
    "clase" TEXT[],

    CONSTRAINT "marcas_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "agentes_id_key" ON "agentes"("id");

-- CreateIndex
CREATE UNIQUE INDEX "agentes_nombre_key" ON "agentes"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "marcas_id_key" ON "marcas"("id");

-- AddForeignKey
ALTER TABLE "expedientes" ADD CONSTRAINT "expedientes_agente_id_fkey" FOREIGN KEY ("agente_id") REFERENCES "agentes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "expedientes" ADD CONSTRAINT "expedientes_marca_id_fkey" FOREIGN KEY ("marca_id") REFERENCES "marcas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "titulares" ADD CONSTRAINT "titulares_agente_id_fkey" FOREIGN KEY ("agente_id") REFERENCES "agentes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
