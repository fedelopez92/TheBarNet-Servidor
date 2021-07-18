const express = require('express');
const bodyParser = require('body-parser'); 
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlTarjetas');

router.get('/', (req, res)=>{

    sql.traerTarjetas()
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/:id', (req, res)=>{

    sql.traerTarjetaId(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/examples/codes', (req, res)=>{

    sql.traerCodigos()
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/', (req, res)=>{
    
    let datos = [req.body.idBanco, req.body.nombre, req.body.tipo, req.body.cuotasSinInteres, req.body.cuotasConInteres];

    sql.insertarTarjeta(datos)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.put('/:id', (req, res)=>{

    let datos = [req.body.idBanco, req.body.nombre, req.body.tipo, req.body.cuotasSinInteres, req.body.cuotasConInteres];

    sql.modificarTarjeta(datos, req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.delete('/:id', (req, res)=>{

    sql.eliminarTarjeta(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

module.exports = router;