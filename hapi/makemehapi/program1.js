var Hapi = require('hapi');
var server = new Hapi.Server();

server.connection({
  host: 'localhost',
  port: Number(process.argv[2] || 8080)
});

server.route({
  path: '/',
  method: 'GET',
  handler: (req, reply) => {
    reply('Hello hapi');
  }
});

server.start(function() {
  console.log('Server running at: ', server.info.uri);
});
