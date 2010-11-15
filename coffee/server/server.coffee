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


class SharedCanvas
  constructor: ->
    @drawings = []
    
  drawLine: (sx, sy, ex, ey) ->
    @drawings.push {line: [sx, sy, ex, ey]}
    
line = [45, 66, 78, 98]
class MyDrawing extends SharedCanvas
  step: ->
    @upToStep ?= 0
    line = p + @upToStep for p in line
    @drawLine(line...) if (@upToStep % 7 is 2)
    @upToStep += 1

socket = io.listen(server)
clients = []
canvas = new MyDrawing()
viewport = [10, 10, 200, 200]

update = ->
  canvas.step()
  viewport = pos + 1 for pos in viewport
  for client in clients when client?
    client.send {worldCanvas: {serverCanvas: canvas, viewport: viewport}}
  
periodicUpdate = ->
  update()
  setTimeout(periodicUpdate, 1000)

socket.on('connection', (client) ->
  client.send({canvas: canvas, viewport: viewport })
  clients.push(client)
  client.on 'disconnect', ->
    clients[clients.indexOf(client)] = null
)
periodicUpdate()