const app = require('express')();
const http = require('http').Server(app);
const config = require('./config');
const formidable = require('express-formidable');
const expressSession = require('express-session');
const compression = require('compression');
const server = app.listen(config.port);
const io = require('socket.io').listen(server);
const authController = require('./controllers/auth.controller');
const dataController = require('./controllers/data.controller');
const chatController = require('./controllers/chat.controller');
const logController = require('./controllers/logging.controller');
const logger = require('./controllers/logging.controller.js').logger;
const cacher = require('./controllers/caching.controller');
const expiryDate = new Date(Date.now() + 60 * 60 * 1000); // 1 hour

const getSessionConfig = function (app) {
    const inProduction = app.get('env') === 'production';
    return {
        secret: 'a-Very-sECREt-K3y!',
        resave: false,
        saveUninitialized: false,
        cookie: {
            secure: inProduction,
            httpOnly: true,
            expires: expiryDate
        }
    }
};

const needsAuth = function (req, res, next) {
    req.needsAuth = true;
    next();
};

/* The ROUTES */

/*
 * config of session
 * secure homeroute...
 */

app.get('/', needsAuth);
app.use(expressSession(getSessionConfig(app)));
app.use(authController.authorizeRequestHandler);
app.use(compression());

/* homeroute */
app.get('/', dataController.dataGetHomeHandler);

/* public routes */
app.get('/new', authController.registerGetNew);
app.post('/new', formidable());
app.post('/new', authController.registerPostNew);
app.get('/success', authController.registerSuccess);
app.get('/login', authController.loginGetHandler);
app.post('/login', formidable());
app.post('/login', authController.loginPostHandler);


/* public files */
app.get('/style.css', function (req, res) {
    cacher.noCaching(res);
    res.sendFile(__dirname + '/style/style.css');
});
app.get('/scripts.js', function (req, res) {
    cacher.sevenDayCaching(res);
    res.sendFile(__dirname + '/javascript/scripts.js');
});
app.get('/grade_worker.js', function (req, res) {
    cacher.sevenDayCaching(res);
    res.sendFile(__dirname + '/javascript/grade_worker.js');
});
app.get('/geolocation.js', function (req, res) {
    cacher.sevenDayCaching(res);
    res.sendFile(__dirname + '/javascript/geolocation.js');
});
app.get('/snap.svg-min.js', function (req, res) {
    cacher.sevenDayCaching(res);
    res.sendFile(__dirname + '/javascript/snap.svg-min.js');
});
app.get('/clock.js', function (req, res) {
    cacher.sevenDayCaching(res);
    res.sendFile(__dirname + '/javascript/clock.js');
});
app.get('/images/code-1839406_header.jpg', function (req, res) {
    cacher.sevenDayCaching(res);
    res.sendFile(__dirname + '/images/code-1839406_header.jpg');
});
app.get('/images/landmark.png', function (req, res) {
    cacher.sevenDayCaching(res);
    res.sendFile(__dirname + '/images/landmark.png');
});
app.get('/images/favicon.ico', function (req, res) {
    cacher.sevenDayCaching(res);
    res.sendFile(__dirname + '/images/favicon.ico');
});
app.get('/images/fh_loadcircle.svg', function (req, res) {
    cacher.sevenDayCaching(res);
    res.sendFile(__dirname + '/images/fh_loadcircle.svg');
});
app.get('/socket.io/socket.io.js', function (req, res) {
    cacher.sevenDayCaching(res);
    res.sendFile(__dirname + '/node_modules/socket.io-client/dist/socket.io.js');
});
app.get('/javascript/chatFunctions.js', function (req, res) {
    cacher.noCaching(res);
    res.sendFile(__dirname + '/javascript/chatFunctions.js');
});


/* secure routes, authentication needed*/
app.use(function (req, res, next){
    if (req.session.user === undefined) {
        logger.debug("Session: " + req.session.user + " , url:" + req.url);
        res.redirect('/');
    } else {
        logger.debug("Session: " + req.session.user + " , url:" + req.url);
        next();
    }
});
app.get('/schedular', dataController.dataGetSchedular);
app.get('/map', dataController.dataGetMap);
app.get('/grades', dataController.dataGetGrades);
app.get('/chat', chatController.getChat);
app.get('/logout', authController.logoutGetHandler);


/* 404 Page */
app.use(dataController.dataGetNotFound);

/* Catch Errors and log them */
app.use(logController.logToConsole);
app.use(logController.dataGetError);

io.on('connection', function(socket){
    socket.on('chat message', function(msg){
        io.emit('chat message', msg);
    });
});
