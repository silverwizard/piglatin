var piglatin = require('pig-latin');
var http = require('http');

server = http.createServer(function (req, res) {
	res.write(piglatin(req.url.replace("/","")));
});
	server.listen(8124, "0.0.0.0");
console.log('Server running at http://127.0.0.1:8124/');
