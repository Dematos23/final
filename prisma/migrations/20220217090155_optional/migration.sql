-- DropForeignKey
ALTER TABLE "tareas" DROP CONSTRAINT "tareas_expediente_id_fkey";

-- AlterTable
ALTER TABLE "tareas" ALTER COLUMN "expediente_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "tareas" ADD CONSTRAINT "tareas_expediente_id_fkey" FOREIGN KEY ("expediente_id") REFERENCES "expedientes"("id") ON DELETE SET NULL ON UPDATE CASCADE;
