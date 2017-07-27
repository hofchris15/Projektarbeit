const exceptions = {
    NullPointerException: function (message) {
        this.message = message;
        this.name = "NullPointerException";
    },
    
    InvalidInputException: function (message) {
		this.message = message;
        this.name = "InvalidInputException";
	}

}

const upenull = "Entweder username, password oder email waren beim Aufruf 'null'";
const badmail = function (email) {return "Die angegebene Email-Addresse ist ungültig: " + email};
const nouspass = function (user, pass) {return "Username und Passwort müssen ausgefüllt werden. " + user + " und " + pass + " sind zu wenig!"};
const baduser = function (user) {return "Der Username '" + user + "' ist nicht erlaubt, bitte keine Sonderezeichen" }; 

module.exports = {
	NullPointerException: exceptions.NullPointerException,
	InvalidInputException: exceptions.InvalidInputException,
	upenull: upenull,
	badmail: badmail,
	nouspass: nouspass,
	baduser: baduser
}
