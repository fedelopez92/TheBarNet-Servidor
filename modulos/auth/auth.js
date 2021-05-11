
const jwt = require('jsonwebtoken');

function crearToken(datos){
    return new Promise((resolve, reject)=>{

        let token = jwt.sign({ email: datos.email}, 'thebarnet345322567');
        if(token != null){
            resolve(token);
        }
        reject("no se genero token");
})
}

module.exports.crearToken = crearToken;

