http = require('http')
url = require('url')
fs = require('fs')
io = require('../../socket.io/')
sys = require('sys')

server = http.createServer (req, res) ->
  path = url.parse(req.url).pathname
  path = '/index.html' if path is '/'
  fs.readFile( __dirname + '/../public' + path, (err, data) ->
    (return dispatch(req, res, path, err)) if err?
    js_prefix = /^\/javascript/
    'TODO serve up correct mimetype so that images can be loaded!'
    res.writeHead(200, {'Content-Type': (path.match js_prefix ? 'text/javascript' : 'text/html')})
    res.write(data, 'utf8')
    res.end()
  )

dispatch = (req, res, path, err)->
  send404(res)  
  
send404 = (res) ->
	res.writeHead(404)
	res.write('404')
	res.end()

server.listen(8080, {
  transportOptions: {
    'xhr-polling': {
      closeTimeout: 1000 * 60 * 5 
    }
  }
})
		
socket = socket.listen(server)
buffer = []
		
socket.on 'connection', (client) ->
	client.send { buffer: buffer }
	client.broadcast { announcement: client.sessionId + ' connected' }

	client.on 'message', (message) ->
		msg = { message: [client.sessionId, message] }
		buffer.push(msg)
		buffer.shift() if (buffer.length > 15)
		client.broadcast(msg)

	client.on 'disconnect', ->
		client.broadcast { announcement: client.sessionId + ' disconnected' }

class SharedCanvas
  
  
  