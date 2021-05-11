
const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });


//funcion como promesa
function traerUsuarios(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select * from usuario', (e, data, fields)=>{ 

        //e son los errores
        //data son los datos
        //fields son los campos

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerUsuarioId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select tipo, nombre, apellido, dni, cuit, email, password, telefono, direccion, localidad, provincia, codigoPostal from usuario where id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerUsuarioEmail(email){ 
    return new Promise((resolve, reject)=>{

        conn.query('select tipo, nombre, apellido, dni, cuit, email, password, telefono, direccion, localidad, provincia, codigoPostal from usuario where email = ?', email, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function insertarUsuario(datos){ 
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO usuario (tipo, nombre, apellido, dni, cuit, email, password, telefono, direccion, localidad, provincia, codigoPostal, confiable) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("Usuario agregado !");
    })

})
}


module.exports.traerUsuarios = traerUsuarios;
module.exports.traerUsuarioEmail = traerUsuarioEmail;
module.exports.traerUsuarioId = traerUsuarioId;
module.exports.insertarUsuario = insertarUsuario;


