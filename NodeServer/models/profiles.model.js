const dataDir = "./profiles/";
const exceptions = require('./exceptions');
const logger = require('../controllers/logging.controller.js').logger;
const fs = require('fs'),
		val = require('validator');

const profiles = {
    newProfile: function (username, password, firstname, lastname, email) {
        if(username === null || password === null || email === null){
            throw new exceptions.NullPointerException(exceptions.upenull);
        } else {
			validate(email, username, password);
			var user = {username: username, firstname: firstname, lastname: lastname, email: email, password: password};
			logger.info("New user: " + username);
			return user;
        }
    },

    storeProfile: function (profile) {
        if(!fs.existsSync(dataDir)){
            fs.mkdirSync(dataDir);
        }
        var username = val.blacklist(profile.username, new RegExp('\\W') );
        profile.username = username;
        var fileDir = dataDir + username + "/";
        if(!fs.existsSync(fileDir)) {
            fs.mkdirSync(fileDir);
        }
        fs.writeFile(fileDir + username + ".json", JSON.stringify(profile), "utf8", (err) => {
            if(err) {throw err};
            logger.info(username + '.json file stored');
        })
    },

    profileExists: function (username, email) {
		username = val.blacklist(username, new RegExp('\\W') );
        var file = dataDir + username + "/" + username + '.json';
        try{
            var data = fs.readFileSync(file, 'utf-8');
            var fields = JSON.parse(data);
            if(fields.email === email) {
                return true;
            } else {
				logger.info("User " + username + "(" + email + ") does not exist");
                return false;
            }
        }catch (err) {
            return false;
        }
    }
};

const validate = function(email, username, password) {
	if (!val.isEmail(email))
		throw new exceptions.InvalidInputException(exceptions.badmail(email));
	if (val.isEmpty(username) || val.isEmpty(password))
		throw new exceptions.InvalidInputException(exceptions.nouspass(username, password));
	if (!val.isAlphanumeric(username))
		throw new exceptions.InvalidInputException(exceptions.baduser(username));
}

module.exports = profiles;
