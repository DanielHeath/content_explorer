transform_line = (line, viewport) ->
  line[i] - viewport[i % 2] for i in [0..3]
  
$(document).ready ->
  canvas = document.getElementById('world')
  ctx = canvas.getContext('2d')
  ctx.globalCompositeOperation = 'source-over'
  
  socket = new io.Socket(null, {port: 8080, rememberTransport: false})
  socket.connect()
  socket.on('message', (obj) ->
    console.log [obj, obj?.worldCanvas?.serverCanvas?.drawings, obj?.worldCanvas?.viewport]
    canvas.width = canvas.width # Clears the canvas of anything drawn so far.
    lines = transform_line(drawing.line, obj?.worldCanvas?.viewport) for drawing in (obj?.worldCanvas?.serverCanvas?.drawings || [])
    console.log(lines)
    ctx.strokeStyle = "black"
    ctx.strokeText("text", line[2], line[3]) for line in lines # TODO Lookup how canvas actually draws lines!
  )