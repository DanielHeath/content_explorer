window.message = (obj) ->
  el = document.createElement('p')
  (if (obj.announcement?)
    el.innerHTML = '<em>' + esc(obj.announcement) + '</em>'
  else if (obj.message?) 
    el.innerHTML = '<b>' + esc(obj.message[0]) + ':</b> ' + esc(obj.message[1])
  )
  document.getElementById('chat').appendChild(el)
  document.getElementById('chat').scrollTop = 1000000

window.send = ->
  val = document.getElementById('text').value
  socket.send(val)
  message({ message: ['you', val] })
  document.getElementById('text').value = ''
  
window.esc = (msg) ->
  return msg.replace(/</g, '&lt').replace(/>/g, '&gt')

socket = new io.Socket(null, {port: 8080, rememberTransport: false})
socket.connect()
socket.on('message', (obj) ->
  if (obj.buffer)
    document.getElementById('form').style.display='block'
    document.getElementById('chat').innerHTML = ''
    message(i) for i in obj.buffer
  else message(obj)
)