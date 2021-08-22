var http = require('http');
var server = http.createServer(function (req, res) {
    res.end("YOU'RE A WIZARD.\n");
});
server.listen(8000);

