const mysql = require('mysql');
const conn = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : '',
    database : 'id16614203_thebarnet'  
  });

  function traerCategorias(){ 
    return new Promise((resolve, reject)=>{

        conn.query('select * from categoriaprod', (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}

function traerCategoriaId(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('select nombre, foto from categoriaprod where id = ?', id, (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve(data);
    })
})
}


function insertarCategoria(datos){
    return new Promise((resolve, reject)=>{

        conn.query('INSERT INTO categoriaprod (nombre) VALUES (?)', [datos], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve({ mensaje: "added", idCategoria: data.insertId});
    })

})
}

function insertarFoto(foto, idCategoria){ 
    return new Promise((resolve, reject)=>{

        conn.query('UPDATE categoriaprod SET foto = ? WHERE id = ?', [foto, idCategoria], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve({ mensaje: "added", idCategoria: idCategoria});
    })
})
}

function eliminarCategoria(id){ 
    return new Promise((resolve, reject)=>{

        conn.query('DELETE FROM categoriaprod WHERE id = ?', [id], (e, data, fields)=>{ 

        if(e != null){
            reject(e);
            return;
        }

        resolve("deleted");
    })
})
}


module.exports.traerCategorias = traerCategorias;
module.exports.traerCategoriaId = traerCategoriaId;
module.exports.insertarCategoria = insertarCategoria;
module.exports.insertarFoto = insertarFoto;
module.exports.eliminarCategoria = eliminarCategoria;


