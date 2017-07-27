const dataView = require('./../views/data.view.js');
const logger = require('../controllers/logging.controller.js').logger;
const cacher = require('./caching.controller');

var generateHomePage = function (req, res) {
    logger.debug("generateHomePage: " + req.session.user);
    cacher.sevenDayCaching(res);
    res.send(dataView.renderHome(req.session.user));
};

var generateSchedular = function (req, res) {
    logger.debug("generateSchedular: " + req.session.user);
    cacher.sevenDayCaching(res);
    var user = req.session.user;
    res.send(dataView.renderSchedular(user));
};

var generateGradesForm = function (req, res) {
    logger.debug("generateGradesForm: " + req.session.user);
    cacher.sevenDayCaching(res);
    var user = req.session.user;
    res.send(dataView.renderGradesForm(user))
};

var generateMap = function (req, res) {
    logger.debug("generateMap: " + req.session.user);
    cacher.sevenDayCaching(res);
    var user = req.session.user;
    res.send(dataView.renderMap(user))
};

var generateNotFound = function (req, res, next) {
	if (res.finished)
		return
    logger.debug("generateNotFound: " + req.session.user);
    cacher.sevenDayCaching(res);
    logger.debug("The page " + req.url + " could not be reached, reqested by " + (req.headers['x-forwarded-for'] || req.connection.remoteAddress));
    res.status(404);
    res.send(dataView.render404(req.url));
};


module.exports = {
    dataGetHomeHandler: generateHomePage,
    dataGetSchedular: generateSchedular,
    dataGetGrades: generateGradesForm,
    dataGetMap: generateMap,
    dataGetNotFound: generateNotFound
};
