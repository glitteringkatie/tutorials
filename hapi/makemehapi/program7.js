var Hapi = require('hapi');
var Vision = require('vision');
var Path = require('path');

var server = new Hapi.Server({
  connections: {
    routes: {
      files: {
        relativeTo: __dirname
      }
    }
  }
});

server.connection({
  host: 'localhost',
  port: Number(process.argv[2] || 8080)
});

server.register(Vision, (err) => {
  if (err) throw err;
});

server.route({
  path: '/',
  method: 'GET',
  handler: {
    view: 'index.html'
  },
});

server.start((err) => {
  if (err) throw err;
});

server.views({
  engines: {
    html: require('handlebars')
  },
  path: Path.join(__dirname, 'templates'),
  helpersPath: 'helpers'
});
