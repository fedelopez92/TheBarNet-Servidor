const express = require('express');
const bodyParser = require('body-parser'); 
const multer  = require('multer')
const router = express.Router({mergeParams:true});
const sql = require('../modulos/sqlProductos');
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

router.use(bodyParser.urlencoded({ extended: false})); 
router.use(bodyParser.json());

router.get('/renderHTML', (req, res) => { //muestra un index con un input de archivos
    res.sendFile('index.html', {
        root: path.join(__dirname, '../')
    })
  })

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

    let datos = [req.body.nombre, req.body.categoria, req.body.precio, req.body.cantidad, req.body.fechaVencimiento, req.body.stockMin, req.body.stockMax, req.body.stockActual];

    sql.insertarProducto(datos)
    .then(data =>{
        res.send(JSON.stringify({rta: data.mensaje, idProducto: data.idProducto}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/upload/:id', upload.single('photo'), (req, res) => { //photo debe ser el nombre del atributo name en input HTML
    let foto = 'http://localhost:4200/uploads/' + req.file.filename;
    let id = req.params.id;

    sql.insertarFoto(foto, id)
    .then(data =>{
        res.send(JSON.stringify({rta: data}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.post('/alternativo', upload.single('photo'), (req, res)=>{ 

    let datos = [req.body.nombre, req.body.categoria, req.body.precio, req.body.cantidad, req.body.fechaVencimiento, req.body.stockMin, req.body.stockMax, req.body.stockActual];
    let foto = 'http://localhost:4200/uploads/' + req.file.filename;

    sql.insertarProducto(datos)
    .then(resultado=> sql.insertarFoto(foto, resultado.idProducto))
    .then(data =>{
        res.send(JSON.stringify({rta: data.mensaje, idProducto: data.idProducto}));
    })
    .catch(error=>{
        res.send(JSON.stringify({rta: error}));
    })
});

router.put('/:id', (req, res)=>{

    let datos = [req.body.nombre, req.body.categoria, req.body.precio, req.body.cantidad, req.body.fechaVencimiento, req.body.fotos, req.body.stockMin, req.body.stockMax, req.body.stockActual];

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