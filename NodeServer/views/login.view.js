const hbs = require('handlebars');
const layout = require('./layout');
const fs = require('fs');
const logger = require('../controllers/logging.controller').logger;

hbs.registerPartial('login-form', fs.readFileSync('./views/partials/login-form.html', 'utf-8'));

hbs.registerPartial('registration', fs.readFileSync('./views/partials/registration.html', 'utf-8'));

hbs.registerPartial('success', fs.readFileSync('./views/partials/success.partial', 'utf-8'))


function renderLoginForm (data, message) {
    logger.debug("renderLoginForm");
    data = data || {}; // If we got no data create an empty object instead
    const viewModel = Object.assign(data, { bodyPartial: 'login-form', message: message});
    return layout(viewModel);
}

function renderRegistration(){
    logger.debug("renderRegistration");
    const viewModel = {bodyPartial: 'registration'};
    return layout(viewModel);
}

function successView(){
    logger.debug("successView");
    const viewModel = {bodyPartial: 'success'};
    return layout(viewModel);
}

module.exports = {
    render: renderLoginForm,
    renderRegisterForm: renderRegistration,
    renderSuccess: successView
};
