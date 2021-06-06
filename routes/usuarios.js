const express = require('express');
const bodyParser = require('body-parser'); 
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlUsers');

router.use(bodyParser.urlencoded({ extended: false})); 
router.use(bodyParser.json());


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

router.post('/', (req, res)=>{

    let datos = [req.body.tipo, req.body.nombre, req.body.apellido, req.body.dni, req.body.cuit, req.body.email, req.body.password, req.body.telefono, req.body.direccion, req.body.localidad, req.body.provincia, req.body.codigoPostal, req.body.confiable];

    sql.insertarUsuario(datos)
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