/*
  Warnings:

  - The values [CAJA] on the enum `Categorias` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Categorias_new" AS ENUM ('CLIENTE', 'PAGOS', 'RRHH', 'ALMACEN', 'COBRANZA');
ALTER TABLE "tareas" ALTER COLUMN "categoria" TYPE "Categorias_new" USING ("categoria"::text::"Categorias_new");
ALTER TYPE "Categorias" RENAME TO "Categorias_old";
ALTER TYPE "Categorias_new" RENAME TO "Categorias";
DROP TYPE "Categorias_old";
COMMIT;
