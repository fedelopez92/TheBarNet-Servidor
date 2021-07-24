const express = require('express');
const multer  = require('multer');
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlCategorias');
const path = require('path');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, './uploads')
    },
    filename: function (req, file, cb) {
      cb(null, file.fieldname + Date.now() + file.originalname.substr(-4))
    }
})
const upload = multer({ storage: storage })

router.get('/renderHTML', (req, res) => { //muestra un index con un input de archivos
    res.sendFile('./public/indexCategoria.html', {
        root: path.join(__dirname, '../')
    })
  })

router.get('/', (req, res)=>{

    sql.traerCategorias()
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.get('/:id', (req, res)=>{

    sql.traerCategoriaId(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/', (req, res)=>{ 

    let datos = [req.body.nombre];

    sql.insertarCategoria(datos)
    .then(data =>{
        res.send(JSON.stringify({rta: data.mensaje, idCategoria: data.idCategoria}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/upload/:id', upload.single('photo'), (req, res) => {
    let foto = 'http://localhost:4200/uploads/' + req.file.filename;
    let id = req.params.id;

    sql.insertarFoto(foto, id)
    .then(data =>{
        res.send(JSON.stringify({rta: data.mensaje, idCategoria: data.idCategoria}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.delete('/:id', (req, res)=>{

    sql.eliminarCategoria(req.params.id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

module.exports = router;