const express = require('express');
const bodyParser = require('body-parser'); 
const router = express.Router({mergeParams:true});
const auth = require('../modulos/auth');
const sql = require('../modulos/sql');

router.post('/', (req, res, next)=>{
    var loggeado = false;
    sql.traerUsuarios()
    .then(data =>{
        JSON.parse(JSON.stringify(data)).forEach(item => {
            if(item.email == req.body.email && item.password == req.body.password){

                loggeado= true;
                req.datosUsuario = item;
                next();
            }
        });
        if(loggeado == false){
            res.send("El email o contraseña son incorrectos");
        }
    })
    .catch(error=>{
        console.log(error);
    })
},function (req, res) {  
    auth.crearToken(req.datosUsuario)
    .then(data =>{  
        res.send(data);
    })
    .catch(error=>{
        console.log(error);
    })
});

router.get('/', (req, res)=>{

    auth.verificarToken(req.headers.token)
    .then(data =>{
        res.json(data);
    })
    .catch(error=>{
        res.send("token invalido");
    })
});


module.exports = router;