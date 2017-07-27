const hbs = require('handlebars');
const fs = require('fs');



const layout = hbs.compile(fs.readFileSync('./views/partials/layout.html', 'utf-8'));

module.exports = layout;
