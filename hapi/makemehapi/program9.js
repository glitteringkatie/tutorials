var Hapi = require('hapi');
var Joi = require('joi');

var server = new Hapi.Server();

server.connection({
	host: 'localhost',
	port: Number(process.argv[2] || 8080)
});

server.route({
	path: '/chickens/{breed}',
	method: 'GET',
	handler: (req, reply) => {
		reply('Chicken breed: ' + req.params.breed);
	},
	config: {
		validate: {
			params: {
				breed: Joi.string().required(),
			}
		}
	}
});

server.start((err) => {
	if (err) throw err;
	console.log('Server running at: ', server.info.uri);
});
