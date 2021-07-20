const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });


  function traerPrecioEnvios(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select * from precioenvio', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerPrecioEnviosId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select localidad, precio from precioenvio where id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}


function insertarPrecioEnvios(datos){
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO precioenvio (localidad, precio) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("added");
    })

})
}

function modificarPrecioEnvios(datos, id){ 
  return new Promise((resolve, reject)=>{

      conn.query('UPDATE precioenvio SET localidad = ?, precio = ? WHERE id = ?', [datos[0], datos[1], id], (e, data, fields)=>{ 

      if(e != null){
          reject(e);
          return;
      }

      resolve("modified");
  })
})
}


function eliminarPrecioEnvios(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('DELETE FROM precioenvio WHERE id = ?', [id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("deleted");
    })
})
}

module.exports.traerPrecioEnvios = traerPrecioEnvios;
module.exports.traerPrecioEnviosId = traerPrecioEnviosId;
module.exports.insertarPrecioEnvios = insertarPrecioEnvios;
module.exports.modificarPrecioEnvios = modificarPrecioEnvios;
module.exports.eliminarPrecioEnvios = eliminarPrecioEnvios;