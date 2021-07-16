var createError = require('http-errors');
var express = require('express');
var cors = require('cors')
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
const loginRuta = require('./routes/login');
const usuariosRuta = require('./routes/usuarios');
const productosRuta = require('./routes/productos');
const pedidosRuta = require('./routes/pedidos');
const ofertasRuta = require('./routes/ofertas');
const combosRuta = require('./routes/combos');
const enviosRuta = require('./routes/envios');
const sucursalRuta = require('./routes/sucursal');


var app = express();

app.use(function(req, res, next) {
  res.header('Access-Control-Allow-Origin', req.headers.origin || "*");
  res.header('Access-Control-Allow-Methods', 'GET,POST,PUT,HEAD,DELETE,OPTIONS');
  res.header('Access-Control-Allow-Headers', 'content-Type,x-requested-with');
  next();
});

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')))

app.use('/', indexRouter);
app.use('/login', loginRuta);
app.use('/usuarios', usuariosRuta);
app.use('/productos', productosRuta);
app.use('/pedidos', pedidosRuta);
app.use('/ofertas', ofertasRuta);
app.use('/combos', combosRuta);
app.use('/envios', enviosRuta);
app.use('/sucursal', sucursalRuta);

//Para ver las fotos subidas
app.use('/uploads', express.static('uploads'));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
