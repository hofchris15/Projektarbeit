/**
 * Created by Christian on 09.04.2017.
 */

/** common functions*/
const xhttp = new XMLHttpRequest();

function login() {
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("change").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "/login", true);
    xhttp.send();
}

function loadSchedular() {
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("main").innerHTML = this.responseText;
        } else if (this.readyState == 4 && (this.status == 403 || this.status == 404) ) {
			alert("We are sorry! There seems to be a problem with the almaty server");
		}
    };
    xhttp.open("GET", "/schedular", true);
    xhttp.send();
}

/** Canvas 2d*/
var myCanvas;
var canvasContext;
var logo;


window.onload = function() {
    myCanvas = document.getElementById("canvasLogo");
    canvasContext = myCanvas.getContext("2d");
    drawBackground();
    logo = new Logo(0, 120);
    logo.draw();
    animate();
}

function drawBackground() {
    canvasContext.fillStyle = "#76b82a";
    canvasContext.fillRect(0, 0, 1000, 1000);
}

function Logo(positionX, positionY) {
    this.positionX = positionX;
    this.positionY = positionY;
}

Logo.prototype.draw = function() {
    x = this.positionX
    y = this.positionY

    canvasContext.translate(0, 0);
    canvasContext.fillStyle = "black";

    canvasContext.font = "2em Verdana";
    canvasContext.fillText("SWD @ FHJ", x, y);

}

Logo.prototype.move = function(deltaX) {
    this.positionX = this.positionX + deltaX;
}

function animate() {
    setInterval(frame, 9);
    var x = 0;
    var backwards = false;

    function frame() {
        drawBackground();
        if (backwards == true) {
            x = x - 1;
            logo.move(-1);
            logo.draw();
        } else if (backwards == false) {
            x = x + 1;
            logo.move(1);
            logo.draw();
        }
        if (x == 110) {
            backwards = true;
        } else if (x == 0) {
            backwards = false;
        }
    }
}

/**
jQuery function which makes the NavBar stick to the top as soon as it is scrolled to
 */
var startNavBarPos = -1;
window.onscroll = function() {
    var bar = document.getElementById('navigation');
    if (startNavBarPos < 0) startNavBarPos = findPosY(bar);

    if (pageYOffset > startNavBarPos) {
        bar.style.position = 'fixed';
        bar.style.top = 0;
        bar.style.paddingBottom = "1em";
    } else {
        bar.style.position = 'relative';
    }

};
// This is a comment

function findPosY(obj) {
    var curtop = 0;
    if (typeof(obj.offsetParent) != 'undefined' && obj.offsetParent) {
        while (obj.offsetParent) {
            curtop += obj.offsetTop;
            obj = obj.offsetParent;
        }
        curtop += obj.offsetTop;
    } else if (obj.y)
        curtop += obj.y;
    return curtop;
}