var Hapi = require('hapi');
var Fs = require('fs');
var Path = require('path');
var Rot13 = require('rot13-transform');

var server = new Hapi.Server();

server.connection({
  host: 'localhost',
  port: Number(process.argv[2] || 8080)
});

server.route({
  path: '/',
  method: 'GET',
  config: {
    handler: (req, rep) => {
      const text = Fs.createReadStream('text.txt');
      rep(text.pipe(Rot13()));
    }
  }
});

server.start((err) => {
  if (err) throw err;
  console.log(server.info.uri);
});
