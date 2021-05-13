
const jwt = require('jsonwebtoken');

function crearToken(datos){
    return new Promise((resolve, reject)=>{

        let token = jwt.sign({ tipo: datos.tipo, nombre: datos.nombre, apellido: datos.apellido, dni: datos.dni, cuit: datos.cuit, email: datos.email, telefono: datos.telefono, direccion: datos.direccion, localidad: datos.localidad, provincia: datos.provincia, codigoPostal: datos.codigoPostal, confiable: datos.confiable}, 'thebarnet345322567');
        if(token != null){
            resolve(token);
        }
        reject("no se genero token");
})
}


function verificarToken(token){
    return new Promise((resolve, reject)=>{
        jwt.verify(token, 'thebarnet345322567', function(err, decoded) {
            if(err){
                reject(err);
                return;
            }
            resolve(decoded);

        });
    })  
} 

module.exports.crearToken = crearToken;
module.exports.verificarToken = verificarToken;

