var map;
var markers = [];
var cpos;

function getGeolocation(cb) {
		var errorPrompt = function(message) { 
			alert(message);
			document.getElementById("loading").innerHTML = message;
		};
	
		if (navigator && navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(cb, function(err){
				errorPrompt("No geolocation found!");
				});
		} else { 
			errorPrompt("Geolocation not supported!");
		}
};

function viewCurrPos() {
	getGeolocation(function(pos) {
		map.setView(new ol.View({
			center: ol.proj.fromLonLat([pos.coords.longitude, pos.coords.latitude]),
			zoom: 11
		}));
	});
};

function addMarker(event) {
	setMarker(event.coordinate);
	markers.push(event.coordinate);
	history.pushState(markers, '', '');
};

function historyMarkers() {
	if (history.state != null) {
		markers = history.state;
	}
	for (var i = 0; i < markers.length; i++) {
		setMarker(markers[i]);
	}
	setMarker(cpos);
};

function makeMarkerLayer(coords) {
	var feature = new ol.Feature({
		geometry: new ol.geom.Point(coords)
	});
	
	var iconStyle = new ol.style.Style({
		image: new ol.style.Icon(({
		anchor: [0.5, 1.0],
		anchorOrigin: 'bottom-left',
		anchorXUnits: 'fraction',
		anchorYUnits: 'pixels',
		opacity: 1,
		scale: 0.08,
		src: '/images/landmark.png'
		}))
	});
	
	return new ol.layer.Vector({
			source: new ol.source.Vector({
					features: [feature]
			}),
			style: iconStyle
	});
};

function makeLineLayer(coords) {
	
	var feature = new ol.Feature({
		geometry: new ol.geom.LineString([coords,cpos])
	});
	var dist = haversine(ol.proj.transform(coords,
				'EPSG:3857',
				'EPSG:4326'
		),ol.proj.transform(cpos,
				'EPSG:3857',
				'EPSG:4326'
		));
	var textStyle = new ol.style.Style({
        fill: new ol.style.Fill({
        color: 'rgba(255,255,255,0.4)'
      }),
      stroke: new ol.style.Stroke({
        color: '#37c837',
        width: 1.25
      }),
      text: new ol.style.Text({
        font: '1.8em Calibri,sans-serif',
        fill: new ol.style.Fill({ color: '#37c837' }),
        stroke: new ol.style.Stroke({
          color: '#000', width: 2
        }),
        text: dist
      })
    });
	
	return new ol.layer.Vector({
			source: new ol.source.Vector({
					features: [feature]
			}),
			style: textStyle
	});
};

function setMarker(coords) {
	map.addLayer(makeMarkerLayer(coords));
	if (coords != cpos) {
		map.addLayer(makeLineLayer(coords));
	}
};

function draw() {
	getGeolocation(function(pos) {
		cpos = ol.proj.transform([pos.coords.longitude, pos.coords.latitude],
				'EPSG:4326',
				'EPSG:3857'
		);

	
		map =  new ol.Map({
			target: document.getElementById('map'),
			layers: [
			new ol.layer.Tile({
				source: new ol.source.OSM()
			})
			],
			view: new ol.View({
				center: cpos,
				zoom: 11
			})
		});
		setTimeout(function(){ document.getElementById("loading").outerHTML = '';}, 250);
		map.on('click', function(event) {
			addMarker(event);
		});
	
		setMarker(cpos);
		history.replaceState(markers, '', '');
	});
};

function removeLayer(layer)  {
	setTimeout(function(){	map.removeLayer(layer); }, 1);
};

window.onpopstate = function(event) {
	var layers = map.getLayers();
	var array = layers.getArray();
	var length = array.length;
	var i = 0;
	for ( i = 0; i < length; i++) {
		if (!(array[i] instanceof ol.layer.Tile)) {
			var counter = i;
			removeLayer(array[i]);
		}
	}
	setTimeout(function(){historyMarkers();}, 1);
	
};

// Source Wikipedia Haversine_formula
function haversine(cop1, cop2){ 
	var lop1 = cop1[0];
	var lap1 = cop1[1];
	var lop2 = cop2[0];
	var lap2 = cop2[1];
    var R = 6378.14;
    var dLat = lap2 * Math.PI / 180 - lap1 * Math.PI / 180;
    var dLon = lop2 * Math.PI / 180 - lop1 * Math.PI / 180;
    var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
		Math.cos(lap1 * Math.PI / 180) * Math.cos(lap2 * Math.PI / 180) *
		Math.sin(dLon/2) * Math.sin(dLon/2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    var d = R * c;
    if (d < 1) {
		return (d * 1000).toFixed(0) + ' m';
	} else { 
		return d.toFixed(2) + ' km';
	}
}


for (i = 0; i < 5; i++) {
  history.pushState({}, '');
}

draw();
