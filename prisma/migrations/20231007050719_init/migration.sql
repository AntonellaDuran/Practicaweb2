-- CreateTable
CREATE TABLE "Contrato" (
    "id_contrato" SERIAL NOT NULL,
    "id_pago" INTEGER NOT NULL,
    "fechaInicio" TIMESTAMP(3) NOT NULL,
    "fechaFin" TIMESTAMP(3) NOT NULL,
    "terminos" TEXT NOT NULL,
    "numeroinvitados" INTEGER NOT NULL,
    "estado" TEXT NOT NULL,
    "id_localfk" INTEGER NOT NULL,
    "id_userfk" INTEGER NOT NULL,

    CONSTRAINT "Contrato_pkey" PRIMARY KEY ("id_contrato")
);

-- CreateTable
CREATE TABLE "Local" (
    "id_local" SERIAL NOT NULL,
    "id_ciudad" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,
    "direccion" TEXT NOT NULL,
    "capacidad" INTEGER NOT NULL,
    "descripcion" TEXT NOT NULL,

    CONSTRAINT "Local_pkey" PRIMARY KEY ("id_local")
);

-- CreateTable
CREATE TABLE "Usuario" (
    "id_user" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "direccion" TEXT NOT NULL,
    "telefono" TEXT NOT NULL,
    "correo" TEXT NOT NULL,
    "rol" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_user")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_correo_key" ON "Usuario"("correo");

-- AddForeignKey
ALTER TABLE "Contrato" ADD CONSTRAINT "Contrato_id_localfk_fkey" FOREIGN KEY ("id_localfk") REFERENCES "Local"("id_local") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contrato" ADD CONSTRAINT "Contrato_id_userfk_fkey" FOREIGN KEY ("id_userfk") REFERENCES "Usuario"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;
