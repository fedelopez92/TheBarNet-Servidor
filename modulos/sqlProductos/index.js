const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });


  function traerProductos(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select * from producto', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerProductoId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select nombre, categoria, precio, cantidad, fechaVencimiento, fotos, stockMin, StockMax, stockActual from producto where id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerProductosCategoria(categoria){ 
    return new Promise((resolve, reject)=>{

        conn.query('select nombre, precio, cantidad, fechaVencimiento, fotos, stockMin, StockMax, stockActual from producto where categoria = ?', categoria, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
} 

function insertarProducto(datos){ 
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO producto (nombre, categoria, precio, cantidad, fechaVencimiento, fotos, stockMin, StockMax, stockActual) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("added");
    })

})
}

function modificarProducto(datos, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE producto SET nombre = ?, categoria = ?, precio = ?, cantidad = ?, fechaVencimiento = ?, fotos = ?, stockMin = ?, stockMax = ?, stockActual = ? WHERE id = ?', [datos[0], datos[1], datos[2], datos[3], datos[4], datos[5], datos[6], datos[7], datos[8], id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("modified");
    })
})
}

function eliminarProducto(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('DELETE FROM producto WHERE id = ?', [id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("deleted");
    })
})
}

module.exports.traerProductos = traerProductos;
module.exports.traerProductoId = traerProductoId;
module.exports.traerProductosCategoria = traerProductosCategoria;
module.exports.insertarProducto = insertarProducto;
module.exports.modificarProducto = modificarProducto;
module.exports.eliminarProducto = eliminarProducto;