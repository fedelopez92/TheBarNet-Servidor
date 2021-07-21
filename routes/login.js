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

                loggeado = true;
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
}, async function (req, res) {  
    
    if(req.datosUsuario.confiable == "no"){
       
        res.send(JSON.stringify({rta: "Untrusted user"}));
    }
    else{
        let token = await auth.crearToken(req.datosUsuario)
        res.send(JSON.stringify({rta: token}));
    }
});

router.post('/verify', (req, res)=>{

    auth.verificarToken(req.body.token)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});


module.exports = router;