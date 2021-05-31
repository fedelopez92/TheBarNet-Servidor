const express = require('express');
const bodyParser = require('body-parser'); 
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlProductos');

router.use(bodyParser.urlencoded({ extended: false})); 
router.use(bodyParser.json());

router.get('/', (req, res)=>{

    sql.traerProductos()
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/:id', (req, res)=>{

    sql.traerProductoId(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/category/:name', (req, res)=>{

    sql.traerProductosCategoria(req.params.name)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/', (req, res)=>{

    let datos = [req.body.nombre, req.body.categoria, req.body.precio, req.body.fechaVencimiento, req.body.fotos, req.body.stockMin, req.body.stockMax, req.body.stockActual];

    sql.insertarProducto(datos)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});


router.put('/:id', (req, res)=>{

    let datos = [req.body.nombre, req.body.categoria, req.body.precio, req.body.fechaVencimiento, req.body.fotos, req.body.stockMin, req.body.stockMax, req.body.stockActual];

    sql.modificarProducto(datos, req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.delete('/:id', (req, res)=>{

    sql.eliminarProducto(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

module.exports = router;