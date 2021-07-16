const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });


  function traerSucursal(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select * from sucursal', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}


function modificarSucursal(datos, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE sucursal SET nombre = ?, direccion = ?, horarios = ? WHERE id = ?', [datos[0], datos[1], datos[2], id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("modified");
    })
})
}

module.exports.traerSucursal = traerSucursal;
module.exports.modificarSucursal = modificarSucursal;