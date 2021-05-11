const express = require('express');
const bodyParser = require('body-parser'); 
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sql');

router.use(bodyParser.urlencoded({ extended: false})); 
router.use(bodyParser.json());


router.get('/', (req, res)=>{

    sql.traerUsuarios()
    .then(data =>{
        res.json(data);
    })
    .catch(error=>{
        console.log(error);
    })
});

router.get('/:id', (req, res)=>{

    sql.traerUsuarioId(req.params.id)
    .then(data =>{
        res.json(data);
    })
    .catch(error=>{
        console.log(error);
    })
});

router.post('/', (req, res)=>{

    let datos = [req.body.tipo, req.body.nombre, req.body.apellido, req.body.dni, req.body.cuit, req.body.email, req.body.password, req.body.telefono, req.body.direccion, req.body.localidad, req.body.provincia, req.body.codigoPostal, "yes"];

    sql.insertarUsuario(datos)
    .then(data =>{
        res.json(data);
    })
    .catch(error=>{
        console.log(error);
    })
});


module.exports = router;