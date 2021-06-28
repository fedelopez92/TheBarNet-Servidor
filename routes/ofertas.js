const express = require('express');
const bodyParser = require('body-parser'); 
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlOfertas');

router.use(bodyParser.urlencoded({ extended: false})); 
router.use(bodyParser.json());

router.get('/', (req, res)=>{

    sql.traerOfertas()
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/:id', (req, res)=>{

    sql.traerOfertaId(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/', (req, res)=>{

    let datos = [req.body.idProducto, req.body.nuevoPrecio, req.body.fechaInicio, req.body.fechaFin];

    sql.insertarOferta(datos)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});


router.put('/:id', (req, res)=>{

    let datos = [req.body.idProducto, req.body.nuevoPrecio, req.body.fechaInicio, req.body.fechaFin];

    sql.modificarOferta(datos, req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.delete('/:id', (req, res)=>{

    sql.eliminarOferta(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});



module.exports = router;