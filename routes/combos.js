const express = require('express');
const bodyParser = require('body-parser'); 
const multer  = require('multer')
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlCombos');


router.get('/', (req, res)=>{

    sql.traerCombos()
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/:id', (req, res)=>{

    sql.traerComboId(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/', (req, res)=>{ 

    let datos = [req.body.productos, req.body.precio, req.body.fechaInicio, req.body.fechaFin];

    sql.insertarCombo(datos)
    .then(data =>{
        res.send(JSON.stringify({rta: data.mensaje, idCombo: data.idCombo}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.put('/:id', (req, res)=>{

    let datos = [req.body.productos, req.body.precio, req.body.fechaInicio, req.body.fechaFin];

    sql.modificarCombo(datos, req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.delete('/:id', (req, res)=>{

    sql.eliminarCombo(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

module.exports = router;