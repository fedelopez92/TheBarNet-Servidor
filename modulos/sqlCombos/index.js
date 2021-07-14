const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });


  function traerCombos(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select * from combo', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerComboId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select productos, precio, fechaInicio, fechaFin from combo where id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}




function insertarCombo(datos){
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO combo (productos, precio, fechaInicio, fechaFin) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        } 

        resolve({ mensaje: "added", idCombo: data.insertId });
    })
})
}

function modificarCombo(datos, id){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE combo SET productos = ?, precio = ?, fechaInicio = ?, fechaFin = ? WHERE id = ?', [datos[0], datos[1], datos[2], datos[3], id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("modified");
    })
})
}

function eliminarCombo(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('DELETE FROM combo WHERE id = ?', [id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("deleted");
    })
})
}

module.exports.traerCombos = traerCombos;
module.exports.traerComboId = traerComboId;
module.exports.insertarCombo = insertarCombo;
module.exports.modificarCombo = modificarCombo;
module.exports.eliminarCombo = eliminarCombo; 