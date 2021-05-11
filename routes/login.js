const express = require('express');
const bodyParser = require('body-parser'); 
const router = express.Router({mergeParams:true});
const auth = require('../modulos/auth');
const sql = require('../modulos/sql');

router.get('/', (req, res, next)=>{
    var loggeado = false;
    sql.traerUsuarios()
    .then(data =>{
        JSON.parse(JSON.stringify(data)).forEach(item => {
            if(item.email == req.body.email && item.password == req.body.password){
                
                loggeado= true;
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
    auth.crearToken(req.body)
    .then(data =>{  
        res.send(data);
    })
    .catch(error=>{
        console.log(error);
    })
});


module.exports = router;