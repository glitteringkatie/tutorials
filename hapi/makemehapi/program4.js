var Hapi = require('hapi');
var Inert = require('inert');

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

server.register(Inert, (err) => {
  if (err) throw err;
});

server.route({
  path: '/foo/bar/baz/{param}',
  method: 'GET',
  handler: {
    directory: {
      path: './public'
    }
  }
});

server.start((err) => {
  if (err) throw err;
});
