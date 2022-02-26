/*
  Warnings:

  - You are about to drop the column `modulos` on the `usuarios` table. All the data in the column will be lost.
  - Added the required column `parte_contraria` to the `expedientes` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "EstadosInventario" AS ENUM ('OK', 'INCOMPLETO', 'DANADO', 'DESTRUIDO');

-- CreateEnum
CREATE TYPE "TipoMovimientoInventario" AS ENUM ('INGRESO', 'SALIDA');

-- AlterTable
ALTER TABLE "expedientes" ADD COLUMN     "parte_contraria" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "usuarios" DROP COLUMN "modulos";

-- DropEnum
DROP TYPE "Modulos";

-- CreateTable
CREATE TABLE "modulos" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "modulos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "modulos_usuarios" (
    "assignedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "assignedBy" TEXT NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    "modulo_id" INTEGER NOT NULL,

    CONSTRAINT "modulos_usuarios_pkey" PRIMARY KEY ("usuario_id","modulo_id")
);

-- CreateTable
CREATE TABLE "inventario" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "bultos" INTEGER NOT NULL,
    "unidades" INTEGER NOT NULL,
    "estado" "EstadosInventario" NOT NULL,
    "descripcion" TEXT NOT NULL,
    "usuariosId" INTEGER,
    "expediente_id" INTEGER,

    CONSTRAINT "inventario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "movimientos_inventario" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fecha" TIMESTAMP(3) NOT NULL,
    "tipo" "TipoMovimientoInventario" NOT NULL,
    "bultos" INTEGER NOT NULL,
    "unidades" INTEGER NOT NULL,
    "observaciones" TEXT NOT NULL,
    "invetario_id" INTEGER,

    CONSTRAINT "movimientos_inventario_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "modulos_id_key" ON "modulos"("id");

-- CreateIndex
CREATE UNIQUE INDEX "inventario_id_key" ON "inventario"("id");

-- CreateIndex
CREATE UNIQUE INDEX "movimientos_inventario_id_key" ON "movimientos_inventario"("id");

-- AddForeignKey
ALTER TABLE "modulos_usuarios" ADD CONSTRAINT "modulos_usuarios_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "modulos_usuarios" ADD CONSTRAINT "modulos_usuarios_modulo_id_fkey" FOREIGN KEY ("modulo_id") REFERENCES "modulos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventario" ADD CONSTRAINT "inventario_usuariosId_fkey" FOREIGN KEY ("usuariosId") REFERENCES "usuarios"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventario" ADD CONSTRAINT "inventario_expediente_id_fkey" FOREIGN KEY ("expediente_id") REFERENCES "expedientes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "movimientos_inventario" ADD CONSTRAINT "movimientos_inventario_invetario_id_fkey" FOREIGN KEY ("invetario_id") REFERENCES "inventario"("id") ON DELETE SET NULL ON UPDATE CASCADE;
