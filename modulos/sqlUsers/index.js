
const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });


/* function iniciarSesion(email, clave, callback){

    conn.query('select * from usuarios where email = ? and clave = ?', [email, clave], (e, data, fields)=>{ 

        if(data == ""){
            callback("email o clave son incorrectos");
            return;
        }
        
        callback(null, jwt.sign({ email: data[0].email, clave: data[0].clave, perfil: data[0].perfil }, 'clavesecreta123'));
    })
} */
 

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

function traerUsuariosTipo(tipo){ 
    return new Promise((resolve, reject)=>{

        conn.query('select nombre, apellido, dni, cuit, email, password, telefono, direccion, localidad, provincia, codigoPostal from usuario where tipo = ?', tipo, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
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

        resolve("added");
    })

})
}

function modificarUsuario(datos, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE usuario SET tipo = ?, nombre = ?, apellido = ?, dni = ?, cuit = ?, email = ?, password = ?, telefono = ?, direccion = ?, localidad = ?, provincia = ?, codigoPostal = ?, confiable = ? WHERE id = ?', [datos[0], datos[1], datos[2], datos[3], datos[4], datos[5], datos[6], datos[7], datos[8], datos[9], datos[10], datos[11], datos[12], id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("modified");
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

        resolve("deleted");
    })
})
}


module.exports.traerUsuarios = traerUsuarios;
module.exports.traerUsuarioId = traerUsuarioId;
module.exports.traerUsuariosTipo = traerUsuariosTipo;
module.exports.insertarUsuario = insertarUsuario;
module.exports.modificarUsuario = modificarUsuario;
module.exports.eliminarUsuario = eliminarUsuario;


