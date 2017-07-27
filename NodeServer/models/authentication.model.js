const bcrypt = require('bcrypt-nodejs');
const fs = require('fs');
const val = require('validator');
const exceptions = require('./exceptions');
const dataDir = "./profiles/";
const logger = require('../controllers/logging.controller.js').logger;

module.exports = {
    verifyCredentials: function (username, password) {
			if (username === '_impossible@test') {
			} else if (!val.isAlphanumeric(username))
				throw new exceptions.InvalidInputException(exceptions.baduser(username));
            var file = dataDir + username + "/" + username + '.json';
            try{
                var data = fs.readFileSync(file, 'utf-8');
                var fields = JSON.parse(data);
                var username = fields.username;
                var hash = fields.password;

                if(username && bcrypt.compareSync(password, hash)){
					logger.info("User " + username + " logs in");
                    return true;
                }else{
					logger.info("Someone tried to log in as " + username + " with wrong password >" + password + "<");
                    return false;
                }
            }catch (err) {
                return 'nofile';
            }
    }
};
