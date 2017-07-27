const dataView = require('./../views/data.view.js');
const winston = require('winston'),
	fs = require('fs'),
	parser = require('body-parser'),
	config = require('../config.json');

const level = config.loggerLevel;
const logdir = "./logs/";
if(!fs.existsSync(logdir)){
	fs.mkdirSync(logdir);
}
const errorlog = logdir + "error.log";
const exceptionlog = logdir + "exception.log";

const logger = new(winston.Logger)({
		transports: [
			new (winston.transports.Console)({colorize: true, level: level}),
			new (winston.transports.File)({filename: errorlog, level: level})
		],
		exceptionHandlers: [
			new (winston.transports.File)({filename: exceptionlog})
		]
});
  
/*
 * Logging goes in here
 */

var logConsole = function (err, req, res, next) {
	console.log("An Error occured:");
	var date = new Date();
	var timestamp = "" + date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() +"@" + date.getHours() + ":" + date.getMinutes();
	logger.error(timestamp + " > " + err.name + ": " + err.message);
	logger.log('debug', "Reqest url: " + req.originalUrl);
	next(err);
}

/* Error Page */
var generateErrorPage = function(err, req, res, next) {
	if (err === undefined || res.finished)
		return;
	res.header("Cache-Control", "no-cache, no-store, must-revalidate");
    res.header("Pragma", "no-cache");
    res.header("Expires", 0);
	res.status(500);
	res.send(dataView.renderError(err));
}

module.exports = {
    logToConsole: logConsole,
    dataGetError: generateErrorPage,
    logger: logger
};
