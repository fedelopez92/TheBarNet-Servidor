const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });

  function traerPedidos(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select * from pedido', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function insertarPedido(datos){ 
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO pedido (idUsuario, fecha, total, tipoEnvio, modalidadPago, estado) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("added");
    })

})
}

module.exports.traerPedidos = traerPedidos;
module.exports.insertarPedido = insertarPedido;