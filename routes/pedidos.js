const express = require('express'); 
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlPedidos');
const sqlProductos = require('../modulos/sqlProductos');

router.get('/', (req, res)=>{

    sql.traerPedidos()
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/:id', (req, res)=>{

    sql.traerPedidoId(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/user/:idUsuario', (req, res)=>{

    sql.traerPedidoPorUsuario(req.params.idUsuario)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/prod/:id', async (req, res)=>{

    let ids = await sql.traerProductosPorPedido(req.params.id);
    let arrayProductos = [];//declarar array vacio

    try {
        for await (let id of ids) {
            producto = await sqlProductos.traerProductoId(id.idProducto);
            arrayProductos.push(producto);
        }

        res.send(JSON.stringify({rta: arrayProductos}));
    } 
    catch (error) {
        res.send(JSON.stringify({rta: error}));
    }
});


router.post('/', (req, res)=>{

    let datos = [req.body.idUsuario, req.body.fecha, req.body.total, req.body.tipoEnvio, req.body.modalidadPago, req.body.estado];

    sql.insertarPedido(datos)
    .then(resultadoId=> sql.insertarPedProd(req.body.idsProducto, resultadoId))

    .then(data =>{
        res.send(JSON.stringify({rta: data.mensaje, idPedido: data.idPedido}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.put('/:id', (req, res)=>{

    
    sql.modificarEstado(req.body.estado, req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

module.exports = router;