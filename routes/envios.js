const express = require('express');
const bodyParser = require('body-parser'); 
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlEnvios');

var requestTime = function (req, res, next) {
    let hoy = new Date();
    let fecha = hoy.getDate() + '-' + ( hoy.getMonth() + 1 ) + '-' + hoy.getFullYear();
    let hora = hoy.getHours() + ':' + hoy.getMinutes() + ':' + hoy.getSeconds();
   
    req.requestTime = fecha + ' ' + hora;
    next();
};
   
router.use(requestTime);

router.get('/', (req, res)=>{

    sql.traerEnvios()
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/:id', (req, res)=>{

    sql.traerEnvioId(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/', (req, res)=>{ 

    let fecha = req.requestTime;
    let entregado = "no";
    let datos = [req.body.idUsuario, req.body.idPedido, req.body.idPrecioEnvio, req.body.precio, fecha, req.body.direccion, req.body.codigoPostal, entregado];
    

    sql.insertarEnvio(datos)
    .then(data =>{
        res.send(JSON.stringify({rta: data.mensaje, idEnvio: data.idEnvio}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/entrega/:id', (req, res)=>{ 
   
    let entregado = req.requestTime;
    
    sql.entregaEnvio(entregado, req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.put('/:id', (req, res)=>{

    let datos = [req.body.idUsuario, req.body.idPedido, req.body.idPrecioEnvio, req.body.precio, req.body.fecha, req.body.direccion, req.body.codigoPostal, req.body.entregado];

    sql.modificarEnvio(datos, req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.delete('/:id', (req, res)=>{

    sql.eliminarEnvio(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

module.exports = router;