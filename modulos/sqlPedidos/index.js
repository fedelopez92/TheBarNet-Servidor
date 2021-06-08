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


function traerPedidoId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select idUsuario, fecha, total, tipoEnvio, modalidadPago, estado from pedido where id = ?', id, (e, data, fields)=>{ 

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

        resolve(data.insertId);
    })

})
}

function insertarPedProd(idsProducto, idPedido){
    
    arrayIds = JSON.parse(idsProducto);

    return new Promise((resolve, reject)=>{

        arrayIds.forEach(element => 
            conn.query('INSERT INTO pedprod (idPedido, idProducto) VALUES (?, ?)', [idPedido, element], (e, data, fields)=>{ 

                if(e != null){
                    reject(e);
                    return;
                }
                resolve({ mensaje: "added", idPedido: idPedido });
            })   
        );
})
}

function modificarEstado(estado, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE pedido SET estado = ? WHERE id = ?', [estado, id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("modified");
    })
})
}

module.exports.traerPedidos = traerPedidos;
module.exports.traerPedidoId = traerPedidoId;
module.exports.insertarPedido = insertarPedido;
module.exports.insertarPedProd = insertarPedProd;
module.exports.modificarEstado = modificarEstado;