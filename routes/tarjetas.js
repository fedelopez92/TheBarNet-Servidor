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


module.exports = router;