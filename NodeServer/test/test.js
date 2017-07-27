/**
 * Created by c.hofer on 14.06.2017.
 */

const profiles = require('./../models/profiles.model');
const auth = require('./../models/authentication.model');
var assert = require('assert');

// check mocha is working
describe('Array', function() {
    describe('#indexOf()', function() {
        it('should return -1 when the value is not present', function() {
            assert.equal(-1, [1,2,3].indexOf(4));
        });
    });
});

describe('testProfileError', function () {
	describe('#newProfile()?HappyPath', function(){
        it('should pass without error', function(){
            try {
                profiles.newProfile("u5er", "pass", "first", "last", "user@email.org");
            }catch(err){
                assert.fail("There was an error!");
            }
        });
    });
    describe('#newProfile()?Null', function(){
        it('should throw a NullPointerException', function(){
            try {
                profiles.newProfile(null, null, "test", "user", null);
            }catch(err){
                assert.equal(err.message, "Entweder username, password oder email waren beim Aufruf 'null'");
            }
        });
    });
    describe('#newProfile()?invalidEmail', function(){
        it('should throw a InvalidInputException', function(){
            try {
                profiles.newProfile("user", "pass", "first", "last", "~email~");
            }catch(err){
                assert.equal(err.message, "Die angegebene Email-Addresse ist ungültig: ~email~");
            }
        });
    });
    describe('#newProfile()?Empty', function(){
        it('should throw a InvalidInputException', function(){
            try {
                profiles.newProfile("", "", "first", "last", "user@email.org");
            }catch(err){
                assert.equal(err.message, "Username und Passwort müssen ausgefüllt werden.  und  sind zu wenig!");
            }
        });
    });
    describe('#newProfile()?SpecialChars', function(){
        it('should throw a InvalidInputException', function(){
            try {
                profiles.newProfile("u5s€r", "password", "first", "last", "user@email.org");
            }catch(err){
                assert.equal(err.message, "Der Username 'u5s€r' ist nicht erlaubt, bitte keine Sonderezeichen")
            }
        });
    });
});

describe('StoreProfile', function () {
   describe('#storeProfile()?happypath', function () {
       it('should save without error', function () {
		   var swd = "$2a$10$DSHIY0.6UQ5jSSpJoaCzyOphaPl7XJKgtUYLNt.qmeebuf2Ev5Yja";
           var profile = profiles.newProfile("testuser", swd, "test", "user","testuser@helloworld.com");
           profiles.storeProfile(profile);
       });
   });
   describe('#storeProfile()?sanitize', function () {
       it('should sanitize input without error', function () {
           var profile = {username: "b@d[us'er]", firstname: "Hans", lastname: "Meier", email: "bloedername@text.org", password: "geheim"};
           profiles.storeProfile(profile);
       });
   });
});

describe('AuthenticateUser (requires storeProfile()?happypath', function () {
   describe('#verifyCredentials?happypath', function () {
       it('should authenticate user with result true', function () {
		   var result = auth.verifyCredentials("testuser", "swd");
		   assert.equal(result, true);
       });
   });
   describe('#verifyCredentials?badpassword', function () {
       it('should not authenticate user, because of bad password', function () {
		   var result = auth.verifyCredentials("testuser", "itm");
		   assert.equal(result, false);
       });
   });
   describe('#verifyCredentials?nouser', function () {
       it('should not authenticate user, because there is no file', function () {
		   var result = auth.verifyCredentials( '_impossible@test', "itm");
		   assert.equal(result, 'nofile');
       });
   });
});

