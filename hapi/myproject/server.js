'use strict';

const Hapi = require('hapi');
const Good = require('good');

const server = new Hapi.Server();
server.connection({ port: 2001, host: 'localhost' });

server.route({
  method: 'GET',
  path: '/',
  handler: (request, reply) => {
    reply('Hello, world!');
  }
});

server.route({
  method: 'GET',
  path: '/{name}',
  handler: (request, reply) => {
    reply(`Hello, ${encodeURIComponent(request.params.name)}!`);
  }
});

server.register({
  register: Good,
  options: {
    reporters: {
      console: [
        {
          module: 'good-squeeze',
          name: 'Squeeze',
          args: [{
            response: '*',
            log: '*'
          }]
        },
        {
          module: 'good-console',
        },
        'stdout'
      ]
    }
  }
}, (err) => {
  if (err) {
    throw err;
  }

  server.start((err) => {
    if (err) {
      throw err;
    }

    server.log('info', `Server running at: ${server.info.uri}`);
  });
});
