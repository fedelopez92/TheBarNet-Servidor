const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });

  function traerTarjetas(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select t.nombre, b.nombre as banco, t.tipo, t.cuotasSininteres, t.cuotasConInteres from tarjeta t, banco b', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

module.exports.traerTarjetas = traerTarjetas;
