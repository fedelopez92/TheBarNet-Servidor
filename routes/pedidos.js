const express = require('express');
const bodyParser = require('body-parser'); 
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlPedidos');


router.use(bodyParser.urlencoded({ extended: false})); 
router.use(bodyParser.json());

router.get('/', (req, res)=>{

    sql.traerPedidos()
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/', (req, res)=>{

    let datos = [req.body.idUsuario, req.body.fecha, req.body.total, req.body.tipoEnvio, req.body.modalidadPago, req.body.estado];

    sql.insertarPedido(datos)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

module.exports = router;