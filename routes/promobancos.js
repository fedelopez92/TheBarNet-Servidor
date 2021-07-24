const express = require('express');
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlpromobancos');

router.get('/', (req, res)=>{

    sql.traerPromos()
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/:id', (req, res)=>{

    sql.traerPromoId(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/', (req, res)=>{

    let datos = [req.body.idBanco, req.body.descuento, req.body.fechaInicio, req.body.fechaFin];

    sql.insertarPromo(datos)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});


router.put('/:id', (req, res)=>{

    let datos = [req.body.idBanco, req.body.descuento, req.body.fechaInicio, req.body.fechaFin];

    sql.modificarPromo(datos, req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.delete('/:id', (req, res)=>{

    sql.eliminarPromo(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});



module.exports = router;