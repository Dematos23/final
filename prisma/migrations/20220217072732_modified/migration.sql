/*
  Warnings:

  - A unique constraint covering the columns `[nombre]` on the table `modulos` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "modulos_nombre_key" ON "modulos"("nombre");
