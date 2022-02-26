-- CreateTable
CREATE TABLE "Archivos" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "url" TEXT NOT NULL,
    "tareasId" INTEGER,

    CONSTRAINT "Archivos_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Archivos_id_key" ON "Archivos"("id");

-- CreateIndex
CREATE UNIQUE INDEX "Archivos_url_key" ON "Archivos"("url");

-- AddForeignKey
ALTER TABLE "Archivos" ADD CONSTRAINT "Archivos_tareasId_fkey" FOREIGN KEY ("tareasId") REFERENCES "tareas"("id") ON DELETE SET NULL ON UPDATE CASCADE;
