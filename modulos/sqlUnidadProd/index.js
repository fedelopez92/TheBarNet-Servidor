const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });

  function traerUnidadProd(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select * from unidadprod', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerUnidadProdId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select nombreClave, nombre from unidadprod where id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}


function insertarUnidadProd(datos){
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO unidadprod (nombreClave, nombre) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("added");
    })

})
}

function eliminarUnidadProd(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('DELETE FROM unidadprod WHERE id = ?', [id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("deleted");
    })
})
}

module.exports.traerUnidadProd = traerUnidadProd;
module.exports.traerUnidadProdId = traerUnidadProdId;
module.exports.insertarUnidadProd = insertarUnidadProd;
module.exports.eliminarUnidadProd = eliminarUnidadProd;