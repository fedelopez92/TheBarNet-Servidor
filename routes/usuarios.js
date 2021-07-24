const express = require('express');
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlUsers');

router.get('/', (req, res)=>{

    sql.traerUsuarios()
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/:id', (req, res)=>{

    sql.traerUsuarioId(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/type/:name', (req, res)=>{

    sql.traerUsuariosTipo(req.params.name)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});


router.post('/', (req, res, next)=>{
 
    emailRegistrado = false;
    sql.traerUsuarios()
    .then(data =>{
        JSON.parse(JSON.stringify(data)).forEach(item => {
            if(item.email == req.body.email){

                emailRegistrado = true;
            }
        });

        if(emailRegistrado == true){
            res.send(JSON.stringify({rta: "registered email"}));
        }
        else{
            req.datosUsuario = [req.body.tipo, req.body.nombre, req.body.apellido, req.body.dni, req.body.cuit, req.body.email, req.body.password, req.body.telefono, req.body.direccion, req.body.localidad, req.body.provincia, req.body.codigoPostal, req.body.confiable];
            next();
        }
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
 },function (req, res) {  
    sql.insertarUsuario(req.datosUsuario)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    }) 
});

router.put('/:id', (req, res)=>{

    let datos = [req.body.tipo, req.body.nombre, req.body.apellido, req.body.dni, req.body.cuit, req.body.email, req.body.password, req.body.telefono, req.body.direccion, req.body.localidad, req.body.provincia, req.body.codigoPostal, req.body.confiable];

    sql.modificarUsuario(datos, req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});


router.delete('/:id', (req, res)=>{

    sql.eliminarUsuario(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

module.exports = router;