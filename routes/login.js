const express = require('express');
const bodyParser = require('body-parser'); 
const router = express.Router({mergeParams:true});
const auth = require('../modulos/auth');
const sql = require('../modulos/sqlUsers');


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
            res.send(JSON.stringify({rta: "Incorrect login"}));
        }
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
},function (req, res) {  
    auth.crearToken(req.datosUsuario)
    .then(data =>{  
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/', (req, res)=>{

    auth.verificarToken(req.headers.token)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});


module.exports = router;