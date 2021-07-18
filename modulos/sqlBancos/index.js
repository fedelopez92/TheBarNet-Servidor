const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });

  function traerBancos(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select * from banco', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerBancoId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select nombre from banco where id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}


function insertarBanco(datos){
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO banco (nombre) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("added");
    })

})
}

function modificarBanco(datos, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE banco SET nombre = ? WHERE id = ?', [datos[0], id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("modified");
    })
})
}


function eliminarBanco(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('DELETE FROM banco WHERE id = ?', [id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("deleted");
    })
})
}

module.exports.traerBancos = traerBancos;
module.exports.traerBancoId = traerBancoId;
module.exports.insertarBanco = insertarBanco;
module.exports.modificarBanco = modificarBanco;
module.exports.eliminarBanco = eliminarBanco;