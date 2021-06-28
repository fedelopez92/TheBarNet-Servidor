
const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });

  function traerOfertas(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select o.id, p.nombre, p.categoria, p.precio, p.cantidad, p.fechaVencimiento, p.fotos, p.stockMin, p.stockMax, p.StockActual, o.nuevoPrecio, o.fechaInicio, o.fechaFin from ofertaprod o INNER JOIN producto p on o.idProducto = p.id ', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerOfertaId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select o.id, p.nombre, p.categoria, p.precio, p.cantidad, p.fechaVencimiento, p.fotos, p.stockMin, p.stockMax, p.StockActual, o.nuevoPrecio, o.fechaInicio, o.fechaFin from ofertaprod o INNER JOIN producto p on o.idProducto = p.id where o.id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function insertarOferta(datos){
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO ofertaprod (idProducto, nuevoPrecio, fechaInicio, fechaFin) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        } 

        resolve("added");
    })
})
}

function modificarOferta(datos, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE ofertaprod SET idProducto = ?, nuevoPrecio = ?, fechaInicio = ?, fechaFin = ? WHERE id = ?', [datos[0], datos[1], datos[2], datos[3], id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("modified");
    })
})
}

function eliminarOferta(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('DELETE FROM ofertaprod WHERE id = ?', [id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("deleted");
    })
})
}






module.exports.traerOfertas = traerOfertas;
module.exports.traerOfertaId = traerOfertaId;
module.exports.insertarOferta = insertarOferta;
module.exports.modificarOferta = modificarOferta;
module.exports.eliminarOferta = eliminarOferta;