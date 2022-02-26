/*
  Warnings:

  - The values [TareasCAJA] on the enum `Modulos` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Modulos_new" AS ENUM ('TAREAS', 'CAJA', 'CRM', 'FACTURACION', 'ALMACEN', 'COBRANZA');
ALTER TABLE "usuarios" ALTER COLUMN "modulos" TYPE "Modulos_new" USING ("modulos"::text::"Modulos_new");
ALTER TYPE "Modulos" RENAME TO "Modulos_old";
ALTER TYPE "Modulos_new" RENAME TO "Modulos";
DROP TYPE "Modulos_old";
COMMIT;
