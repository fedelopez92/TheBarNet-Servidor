const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });

  function traerEnvios(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select * from envio', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerEnvioId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select idUsuario, idPedido, idPrecioEnvio, precio, fecha, direccion, codigoPostal, entregado from envio where id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function insertarEnvio(datos){
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO envio (idUsuario, idPedido, idPrecioEnvio, precio, fecha, direccion, codigoPostal, entregado) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        } 

        resolve({ mensaje: "added", idEnvio: data.insertId });
    })
})
}

function modificarEnvio(datos, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE envio SET idUsuario = ?, idPedido = ?, idPrecioEnvio = ?, precio = ?, fecha = ?, direccion = ?, codigoPostal = ?, entregado = ? WHERE id = ?', [datos[0], datos[1], datos[2], datos[3], datos[4], datos[5], datos[6], datos[7], id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("modified");
    })
})
}

function entregaEnvio(entregado, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE envio SET entregado = ? WHERE id = ?', [entregado, id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("added");
    })
})
}

function eliminarEnvio(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('DELETE FROM envio WHERE id = ?', [id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("deleted");
    })
})
}

module.exports.traerEnvios = traerEnvios;
module.exports.traerEnvioId = traerEnvioId;
module.exports.insertarEnvio = insertarEnvio;
module.exports.modificarEnvio = modificarEnvio;
module.exports.entregaEnvio = entregaEnvio;
module.exports.eliminarEnvio = eliminarEnvio;