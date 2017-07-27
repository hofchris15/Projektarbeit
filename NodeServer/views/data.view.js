const hbs = require('handlebars'),
    layout = require('./layout'),
    fs = require('fs');

hbs.registerPartial('Homepage', fs.readFileSync('./views/partials/HomePage.html', 'utf-8'));

hbs.registerPartial('GradesForm', fs.readFileSync('./views/partials/GradesForm.html', 'utf-8'));

hbs.registerPartial('Map', fs.readFileSync('./views/partials/Map.html', 'utf-8'));

/* 404 page */
hbs.registerPartial('404', fs.readFileSync('./views/partials/PageNotFound.html', 'utf-8'));

/* Error page */
hbs.registerPartial('Error', fs.readFileSync('./views/partials/Error.html', 'utf-8'));

function renderHomePage (user){

    const viewModel = {bodyPartial: 'Homepage', user: user};
    return layout(viewModel);
};

function renderSchedularViews(user) {
    var html = `<h1>Stundenplan</h1>
                <iframe src="http://almaty.fh-joanneum.at/stundenplan/"></iframe>`
    return html;

};

function renderForm(user) {
    const viewModel = {bodyPartial: 'GradesForm', user: user};
    return layout(viewModel);
};

function renderMapView(user) {
    const viewModel = {bodyPartial: 'Map', user: user};
    return layout(viewModel);
};

function render404View(url) {
	const viewModel = {bodyPartial: '404', url: url};
	return layout(viewModel);
}

function renderErrorView(err) {
	const viewModel = {bodyPartial: 'Error', name: err.name, message: err.message};
	return layout(viewModel);
}

module.exports = {
    renderHome: renderHomePage,
    renderSchedular: renderSchedularViews,
    renderGradesForm: renderForm,
    renderMap: renderMapView,
    render404: render404View,
    renderError: renderErrorView
};
