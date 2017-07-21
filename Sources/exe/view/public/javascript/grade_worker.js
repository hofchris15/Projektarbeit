/** Grade worker */
const key = "3C9iYWXALB";
var user;
var pass;

self.addEventListener('message', function(e) {
		user = e.data[0];
		pass = e.data[1];
		if (user && pass)
			fetch();
	}, false);

function fetch() {
	var url = "https://ws.fh-joanneum.at/getmarks.php?u=" + user + "&p=" + pass + "&k=" + key;
	var xhttp;
	xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			postMessage(this.responseText);
		} else if (this.readyState == 4 && (this.status == 403 || this.status == 404) ) {
			alert("We are sorry! There seems to be a problem with the FHPI server");
		}
	};
    xhttp.open("GET", url, true);
    xhttp.send()
}

/** Grade_worker */
var w;

function startWorker() {
	var user = document.getElementById("fhusername").value;
	var pass = document.getElementById("fhpassword").value;
	var table = document.getElementById("table");
	var tmp = table.innerHTML;
	if (typeof(Worker) !== "undefined") {
		if (typeof(w) == "undefined") {
			w = new Worker("grade_worker.js");
			var msg = new Array(user,pass);
			w.postMessage(msg);
			var parser, xml;
			parser = new DOMParser();
			document.getElementById("grades").outerHTML = "";
			table.removeAttribute("style");
			w.onmessage = function(e) {
				xml = parser.parseFromString(e.data, "text/xml");
				var len = xml.getElementsByTagName("Course").length;
				var titles = xml.getElementsByTagName("Title");
				var grades = xml.getElementsByTagName("Grade");
				for (var i = 0; i < len; i++) {
					tmp = tmp + "<tr><td>" + titles[i].childNodes[0].nodeValue + "</td><td>" + grades[i].childNodes[0].nodeValue + "</td></tr>";
					document.getElementById("table").innerHTML = tmp;
				}
				stopWorker();
			};
		}
	} else {
		document.getElementById("grades").innerHTML = "<p>We are sorry, but your browser doesn't support webworkers. Grades cannot be fetched!</p>";
	}
}


function stopWorker() {
	if (w)
		w.terminate();
    w = undefined;
}
