const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });


  function traerPromos(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select b.nombre, p.descuento, p.fechaInicio, p.fechaFin from promobanco p, banco b where p.idBanco = b.id', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerPromoId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select b.nombre, p.descuento, p.fechaInicio, p.fechaFin from promobanco p, banco b where p.idBanco = b.id and p.id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}


function insertarPromo(datos){
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO promobanco (idBanco, descuento, fechaInicio, fechaFin) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("added");
    })

})
}

function modificarPromo(datos, id){ 
  return new Promise((resolve, reject)=>{

      conn.query('UPDATE promobanco SET idBanco = ?, descuento = ?, fechaInicio = ?, fechaFin = ? WHERE id = ?', [datos[0], datos[1], datos[2], datos[3], id], (e, data, fields)=>{ 

      if(e != null){
          reject(e);
          return;
      }

      resolve("modified");
  })
})
}


function eliminarPromo(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('DELETE FROM promobanco WHERE id = ?', [id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("deleted");
    })
})
}

module.exports.traerPromos = traerPromos
module.exports.traerPromoId = traerPromoId;
module.exports.insertarPromo = insertarPromo;
module.exports.modificarPromo = modificarPromo;
module.exports.eliminarPromo = eliminarPromo;