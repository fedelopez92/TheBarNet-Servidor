
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

function traerTipoUsuario(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select tipo from usuario where id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data[0]);
    })
})
}

/* function traerUsuarioEmail(email){ 
    return new Promise((resolve, reject)=>{

        conn.query('select tipo, nombre, apellido, dni, cuit, email, password, telefono, direccion, localidad, provincia, codigoPostal from usuario where email = ?', email, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
} */

function insertarUsuario(datos){ 
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO usuario (tipo, nombre, apellido, dni, cuit, email, password, telefono, direccion, localidad, provincia, codigoPostal, confiable) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("Usuario agregado");
    })

})
}

function modificarUsuario(datos, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE usuario SET tipo = ?, nombre = ?, apellido = ?, dni = ?, cuit = ?, email = ?, password = ?, telefono = ?, direccion = ?, localidad = ?, provincia = ?, codigoPostal = ? WHERE id = ?', [datos[0], datos[1], datos[2], datos[3], datos[4], datos[5], datos[6], datos[7], datos[8], datos[9], datos[10], datos[11], id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("El usuario se modificó correctamente");
    })
})
}

function modificarUsuarioConfiable(confiable, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE usuario SET confiable = ? WHERE id = ?', [confiable, id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        if(confiable == "yes"){
            resolve("Usuario confiable");
            return;
        }

        resolve("Usuario no confiable");
    })
})
}

function eliminarUsuario(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('DELETE FROM usuario WHERE id = ?', [id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("Se borró el usuario");
    })
})
}


module.exports.traerUsuarios = traerUsuarios;
module.exports.traerUsuarioId = traerUsuarioId;
module.exports.traerTipoUsuario = traerTipoUsuario;
module.exports.insertarUsuario = insertarUsuario;
module.exports.modificarUsuario = modificarUsuario;
module.exports.modificarUsuarioConfiable = modificarUsuarioConfiable;
module.exports.eliminarUsuario = eliminarUsuario;


