const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });

  function traerTarjetas(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select t.nombre, b.nombre as banco, t.tipo, t.cuotasSinInteres, t.cuotasConInteres from tarjeta t, banco b where t.idBanco = b.id', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerTarjetaId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select t.nombre, b.nombre as banco, t.tipo, t.cuotasSinInteres, t.cuotasConInteres from tarjeta t, banco b where t.idBanco = b.id and t.id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function insertarTarjeta(datos){
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO tarjeta (idBanco, nombre, tipo, cuotasSinInteres, cuotasConInteres) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("added");
    })

})
}

function modificarTarjeta(datos, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE tarjeta SET idBanco = ?, nombre = ?, tipo = ?, cuotasSinInteres = ?, cuotasConInteres = ? WHERE id = ?', [datos[0], datos[1], datos[2], datos[3], datos[4], id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("modified");
    })
})
}


function eliminarTarjeta(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('DELETE FROM tarjeta WHERE id = ?', [id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("deleted");
    })
})
}

//Tabla "codigotarjeta"
function traerCodigos(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select * from codigotarjeta', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}


module.exports.traerTarjetas = traerTarjetas;
module.exports.traerTarjetaId = traerTarjetaId;
module.exports.insertarTarjeta = insertarTarjeta;
module.exports.modificarTarjeta = modificarTarjeta;
module.exports.eliminarTarjeta = eliminarTarjeta;
module.exports.traerCodigos = traerCodigos;