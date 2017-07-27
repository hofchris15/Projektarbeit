/**
 * Created by c.hofer on 08.06.2017.
 */
const hbs = require('handlebars');
const layout = require('./layout');
const fs = require('fs');
const logger = require('../controllers/logging.controller').logger;

hbs.registerPartial('chat', fs.readFileSync('./views/partials/Chat.html', 'utf-8'));

function renderChatView(user) {
    logger.debug("renderChatView for: " + user);
    const viewModel = {bodyPartial: 'chat', user: user};
    return layout(viewModel);
}

module.exports = {
    renderChat: renderChatView
};