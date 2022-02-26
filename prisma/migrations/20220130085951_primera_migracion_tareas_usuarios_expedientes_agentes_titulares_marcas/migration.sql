-- CreateEnum
CREATE TYPE "Roles" AS ENUM ('SUPERADMIN', 'ADMIN', 'SUPERVISOR', 'USUARIO');

-- CreateEnum
CREATE TYPE "Modulos" AS ENUM ('TareasCAJA', 'CRM', 'FACTURACION', 'ALMACEN', 'COBRANZA');

-- CreateEnum
CREATE TYPE "Categorias" AS ENUM ('CLIENTE', 'CAJA', 'RRHH', 'ALMACEN', 'COBRANZA');

-- CreateEnum
CREATE TYPE "Prioridades" AS ENUM ('ALTA', 'MEDIA', 'BAJA');

-- CreateEnum
CREATE TYPE "Estados" AS ENUM ('COMPLETO', 'EN_PROCESO', 'EN_REVISION', 'DETENIDO');

-- CreateEnum
CREATE TYPE "Paises" AS ENUM ('ANGOLA', 'ARGELIA', 'BENIN', 'BOTSUANA', 'BURKINA_FASO', 'BURUNDI', 'CABO_VERDE', 'CAMERUN', 'CHAD', 'COMORAS', 'COSTA_DE_MARFIL', 'EGIPTO', 'ERITREA', 'ETIOPIA', 'GABON', 'GAMBIA', 'GHANA', 'GUINEA', 'GUINEA_ECUATORIAL', 'GUINEA_BISSAU', 'KENIA', 'LESOTO', 'LIBERIA', 'LIBIA', 'MADAGASCAR', 'MALAUI', 'MALI', 'MARRUECOS', 'MAURICIO', 'MAURITANIA', 'MOZAMBIQUE', 'NAMIBIA', 'NIGER', 'NIGERIA', 'REPUBLICA_CENTROAFRICANA', 'REPUBLICA_DEL_CONGO', 'REPUBLICA_DEMOCRATICA_DEL_CONGO', 'RUANDA', 'SANTO_TOME_Y_PRINCIPE', 'SENEGAL', 'SEYCHELLES', 'SIERRA_LEONA', 'SOMALIA', 'SUAZILANDIA', 'SUDAFRICA', 'SUDAN', 'SUDAN_DEL_SUR', 'TANZANIA', 'TOGO', 'TUNEZ', 'UGANDA', 'YIBUTI', 'ZAMBIA', 'ZIMBABUE', 'ANTIGUA_Y_BARBUDA', 'ARGENTINA', 'BAHAMAS', 'BARBADOS', 'BELICE', 'BOLIVIA', 'BRASIL', 'CANADA', 'CHILE', 'COLOMBIA', 'COSTA_RICA', 'CUBA', 'DOMINICA', 'ECUADOR', 'EL_SALVADOR', 'ESTADOS_UNIDOS', 'GRANADA', 'GUATEMALA', 'GUYANA', 'HAITI', 'HONDURAS', 'JAMAICA', 'MEXICO', 'NICARAGUA', 'PANAMA', 'PARAGUAY', 'PERU', 'PUERTO_RICO', 'REPUBLICA_DOMINICANA', 'SAN_CRISTOBAL_Y_NIEVES', 'SAN_VICENTE_Y_LAS_GRANADINAS', 'SANTA_LUCIA', 'SURINAM', 'TRINIDAD_Y_TOBAGO', 'URUGUAY', 'VENEZUELA', 'AFGANISTAN', 'ARABIA_SAUDITA', 'BANGLADES', 'BAREIN', 'BRUNEI', 'BUTAN', 'CAMBOYA', 'CATAR', 'CHINA', 'CHIPRE', 'COREA_DEL_NORTE', 'COREA_DEL_SUR', 'EMIRATOS_ARABES_UNIDOS', 'FILIPINAS', 'INDIA', 'INDONESIA', 'IRAN', 'IRAQ', 'ISRAEL', 'JAPON', 'JORDANIA', 'KAZAJISTAN', 'KIRGUISTAN', 'KUWAIT', 'LAOS', 'LIBANO', 'MALASIA', 'MALDIVAS', 'MONGOLIA', 'MYANMAR_BIRMANIA', 'NEPAL', 'OMAN', 'PAKISTAN', 'PALESTINA', 'SIRIA', 'SRI_LANKA', 'TAILANDIA', 'TAYIKISTAN', 'TIMOR_ORIENTAL', 'TURKMENISTAN', 'TURQUIA', 'UZBEKISTAN', 'VIETNAM', 'YEMEN', 'ALBANIA', 'ALEMANIA', 'ANDORRA', 'ARMENIA', 'AUSTRIA', 'AZERBAIYAN', 'BELGICA', 'BIELORRUSIA', 'BOSNIA_Y_HERZEGOVINA', 'BULGARIA', 'CROACIA', 'DINAMARCA', 'ESLOVAQUIA', 'ESLOVENIA', 'ESPANA', 'ESTONIA', 'FINLANDIA', 'FRANCIA', 'GEORGIA', 'GRECIA', 'HUNGRIA', 'IRLANDA', 'ISLANDIA', 'ITALIA', 'LETONIA', 'LIECHTENSTEIN', 'LITUANIA', 'LUXEMBURGO', 'MALTA', 'MOLDAVIA', 'MONACO', 'MONTENEGRO', 'NORUEGA', 'PAISES_BAJOS', 'POLONIA', 'PORTUGAL', 'REINO_UNIDO', 'REPUBLICA_CHECA', 'REPUBLICA_DE_MACEDONIA', 'RUMANIA', 'RUSIA', 'SAN_MARINO', 'SERBIA', 'SUECIA', 'SUIZA', 'UCRANIA', 'AUSTRALIA', 'FIYI', 'ISLAS_MARSHALL', 'ISLAS_SALOMON', 'KIRIBATI', 'MICRONESIA', 'NAURU', 'NUEVA_ZELANDA', 'PALAOS', 'PAPUA_NUEVA_GUINEA', 'SAMOA', 'TONGA', 'TUVALU', 'VANUATU');

-- CreateEnum
CREATE TYPE "TipoServicio" AS ENUM ('REGISTRO', 'RENOVACION', 'ACTO_MODIFICATORIO', 'OPOSICION', 'CANCELACION', 'ANUALIDAD');

-- CreateTable
CREATE TABLE "tareas" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "tarea" TEXT NOT NULL,
    "categoria" "Categorias" NOT NULL,
    "prioridad" "Prioridades" NOT NULL,
    "estado" "Estados" NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "creador_id" INTEGER NOT NULL,
    "responsable_id" INTEGER NOT NULL,
    "supervisor_id" INTEGER NOT NULL,
    "expediente_id" INTEGER NOT NULL,

    CONSTRAINT "tareas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "usuarios" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "rol" "Roles" NOT NULL,
    "modulos" "Modulos" NOT NULL,

    CONSTRAINT "usuarios_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "expedientes" (
    "id" SERIAL NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "numero_expediente" INTEGER NOT NULL,
    "ano_expediente" TIMESTAMP(3) NOT NULL,
    "fecha_presentacion" TIMESTAMP(3) NOT NULL,
    "numero_resolucion" INTEGER NOT NULL,
    "ano_resolucion" INTEGER NOT NULL,
    "agente_id" INTEGER NOT NULL,
    "titular_id" INTEGER NOT NULL,
    "marca_id" INTEGER NOT NULL,
    "tipo_servicio" "TipoServicio" NOT NULL,

    CONSTRAINT "expedientes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "agente" (
    "id" SERIAL NOT NULL,
    "pais" "Paises" NOT NULL,
    "nombre" TEXT NOT NULL,
    "direccion" TEXT,

    CONSTRAINT "agente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "titulares" (
    "id" SERIAL NOT NULL,
    "pais" "Paises" NOT NULL,
    "nombre" TEXT NOT NULL,
    "direccion" TEXT,
    "agente_id" INTEGER NOT NULL,

    CONSTRAINT "titulares_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Marcas" (
    "id" SERIAL NOT NULL,
    "denominacion" TEXT,
    "logo" TEXT,
    "clase" TEXT[],

    CONSTRAINT "Marcas_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "tareas_id_key" ON "tareas"("id");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_id_key" ON "usuarios"("id");

-- CreateIndex
CREATE UNIQUE INDEX "usuarios_email_key" ON "usuarios"("email");

-- CreateIndex
CREATE UNIQUE INDEX "expedientes_id_key" ON "expedientes"("id");

-- CreateIndex
CREATE UNIQUE INDEX "expedientes_numero_expediente_key" ON "expedientes"("numero_expediente");

-- CreateIndex
CREATE UNIQUE INDEX "expedientes_numero_resolucion_key" ON "expedientes"("numero_resolucion");

-- CreateIndex
CREATE UNIQUE INDEX "expedientes_agente_id_key" ON "expedientes"("agente_id");

-- CreateIndex
CREATE UNIQUE INDEX "expedientes_titular_id_key" ON "expedientes"("titular_id");

-- CreateIndex
CREATE UNIQUE INDEX "expedientes_marca_id_key" ON "expedientes"("marca_id");

-- CreateIndex
CREATE UNIQUE INDEX "agente_id_key" ON "agente"("id");

-- CreateIndex
CREATE UNIQUE INDEX "agente_nombre_key" ON "agente"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "titulares_id_key" ON "titulares"("id");

-- CreateIndex
CREATE UNIQUE INDEX "titulares_nombre_key" ON "titulares"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "titulares_agente_id_key" ON "titulares"("agente_id");

-- CreateIndex
CREATE UNIQUE INDEX "Marcas_id_key" ON "Marcas"("id");

-- AddForeignKey
ALTER TABLE "tareas" ADD CONSTRAINT "tareas_creador_id_fkey" FOREIGN KEY ("creador_id") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tareas" ADD CONSTRAINT "tareas_responsable_id_fkey" FOREIGN KEY ("responsable_id") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tareas" ADD CONSTRAINT "tareas_supervisor_id_fkey" FOREIGN KEY ("supervisor_id") REFERENCES "usuarios"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tareas" ADD CONSTRAINT "tareas_expediente_id_fkey" FOREIGN KEY ("expediente_id") REFERENCES "expedientes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "expedientes" ADD CONSTRAINT "expedientes_titular_id_fkey" FOREIGN KEY ("titular_id") REFERENCES "titulares"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "expedientes" ADD CONSTRAINT "expedientes_agente_id_fkey" FOREIGN KEY ("agente_id") REFERENCES "agente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "expedientes" ADD CONSTRAINT "expedientes_marca_id_fkey" FOREIGN KEY ("marca_id") REFERENCES "Marcas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "titulares" ADD CONSTRAINT "titulares_agente_id_fkey" FOREIGN KEY ("agente_id") REFERENCES "agente"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
