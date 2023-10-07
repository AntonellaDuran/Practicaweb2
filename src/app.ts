
import { PrismaClient } from '@prisma/client';
import { create } from 'domain';

const prisma = new PrismaClient();



const createUser = async () => {
    const userCreate = await prisma.usuario.create({
        data: {
           nombre: "Antonella",
           apellido: "Duran Loor",
           direccion: "Cdla 15 de abril",
           telefono: "0999841203",
           correo: "antonelladuran37@gmail.com",
           rol: "Admin",
        }
    });
    console.log(userCreate);

const createLocal = await prisma.local.create({
    data: {
    
        id_ciudad: 10,
        nombre: "Batilovers",
        direccion:"Calle universitaria 7",
        capacidad:100,
        descripcion: "Comida rapida",
        
    }
}); 
console.log(createLocal);

    const contratoCreated = await prisma.contrato.create({
         data: {
             id_pago: 28,
             fechaInicio: new Date("2023-12-24T00:00:00Z"),
             fechaFin: new Date("2023-11-22T00:00:00Z"),
             terminos: "bbbb",
             numeroinvitados:200,
             estado: "Activo",
             id_localfk:createLocal.id_local,
             id_userfk:userCreate.id_user,
             
         }
     });
     console.log(contratoCreated);
    };
     
 const querycontrato= async ()=>{
     const contrato= await prisma.contrato.findMany({
         include:{
             usuario:true
         }
         , where:{
             id_contrato:1
         }
     })
     console.log(contrato);
 };
 
 const updatecontrato = async ()=>{
     const contrato = await prisma.contrato.update({
         data:{
             numeroinvitados:80
         },
         where:{
             id_contrato:1
         }
     })
 };
 
 const deletecontrato= async ()=>{
     const contrato= await prisma.contrato.delete({
         where:{
             id_contrato:1
         }
     })
 };
 
 (async ()=>{
     await createUser()
     //await querycontrato()
     //await updatecontrato()
     //await deletecontrato()
 })()