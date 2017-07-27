const loginView = require("./../views/login.view"), authentication = require("./../models/authentication.model"),
    profiles = require("./../models/profiles.model"), bcrypt = require("bcrypt-nodejs"),
    logger = require("./logging.controller").logger;
const renderLoginForm = function (req, res) {
    res.send(loginView.render(req.fields, req.session.message))
};
const handleAuthenticationAttempt = function (req, res) {
    logger.debug("handleAuthenticationAttempt");
    var data = req.fields || {};
    var verified;
    if (data.username === "" || data.password === "") {
        res.status(403).send(loginView.render(data, "Bitte gib deine Anmeldeinformationen ein!"))
        return/* Ohne dieses return wird der folgende Code ausgeführt, was einen Fehler auslöst (res.send()*2) */
    } else {
        verified = authentication.verifyCredentials(data.username, data.password)
    }

    if (verified === "nofile") {
        res.status(403).send(loginView.render(data, "Du bist noch nicht registriert!"))
    } else if (verified === false) {
        res.status(403).send(loginView.render(data, "Username oder Passwort falsch!"))
    } else if (verified === true) {
        req.session.user = data.username;
        res.redirect(303, "/")
    } else {
        res.status(500).send(loginView.render(data, "Entschuldige, leider ist ein Fehler aufgetretten! Bitte versuch es später nochmal"));
    }
};
const authorizeRequest = function (req, res, next) {
    logger.debug("authorizeRequest for: " + req.session.user);
    if (req.needsAuth) {
        if (req.session.user) {
            next()
            return
        } else {
            logger.debug("authorizeRequest: user is undefind");
            res.redirect(303, "/login")
            return
        }
    } else {
        next()
    }
};
const destroySession = function (req, res) {
    logger.debug("destroySession");
    req.session.destroy();
    res.redirect(303, "/login")
};
const renderRegisterForm = function (req, res) {
    logger.debug("renderRegisterForm");
    res.send(loginView.renderRegisterForm())
};
const renderPostNew = function (req, res) {
    logger.debug("renderPostNew");
    var alreadyExist = profiles.profileExists(req.fields.username, req.fields.email);
    if (alreadyExist) {
        res.status(303).send(loginView.render(req.fields, "Du hast bereits einen Account"))
    } else {
        var password = req.fields.password;
        req.session["user"] = req.fields.username;
        req.session["email"] = req.fields.email;
        var salt = bcrypt.genSaltSync(10);
        var hash = bcrypt.hashSync(password, salt);
        var newProfile = profiles.newProfile(req.fields.username, hash, req.fields.firstname, req.fields.lastname, req.fields.email);
        profiles.storeProfile(newProfile);
        res.status(303).redirect("/success")
    }
};
const renderSuccess = function (req, res) {
    logger.debug("renderSuccess for: " + req.session.user);
    res.send(loginView.renderSuccess())
};
module.exports = {
    loginGetHandler: renderLoginForm,
    loginPostHandler: handleAuthenticationAttempt,
    authorizeRequestHandler: authorizeRequest,
    logoutGetHandler: destroySession,
    registerGetNew: renderRegisterForm,
    registerPostNew: renderPostNew,
    registerSuccess: renderSuccess
};
