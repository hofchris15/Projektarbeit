/**
 * Created by c.hofer on 08.06.2017.
 */

const chatView = require('../views/chat.view');
const logger = require('../controllers/logging.controller.js').logger;

function generateChat(req, res) {
    logger.debug("generateChat for: " + req.session.user);
    var user = req.session.user;
    logger.info(user + " started to chat");
    res.send(chatView.renderChat(user))
}

module.exports = {
    getChat: generateChat
};
