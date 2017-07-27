const logger = require('./logging.controller').logger;
const oneDay = 86400000;

var noCaching = function (res) {
    logger.debug("noChaching");
    res.header("Cache-Control", "no-cache, no-store, must-revalidate");
    res.header("Pragma", "no-cache");
    res.header("Expires", 0);
};

var sevenDayCaching = function (res) {
    var d = new Date();
    d.setDate(d.getDate() + 7);
    res.header("Cache-Control", "public, max-age=" + oneDay * 7);
    res.header("Pragma", "cache");
    res.header("Expires", d);
};

module.exports = {
    noCaching: noCaching,
    sevenDayCaching: sevenDayCaching
};