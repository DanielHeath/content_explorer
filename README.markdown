# M.F. Tanks

A simple tank battle game, where you design your tank's "AI" to survive and
grow.

The goal is to have both single- and multi-player modes:

In single-player mode, you don't need any form of webserver; simply load a
static html file with the file:// protocol, and it pulls in everything it needs
to get a game going.

In multi-player mode, you'll need a server, and some clients. The server runs
in node.js. It serves up the game client page to players, and acts as a
websocket server to tell the clients what to render. Clients connect and tell
the server how they'd like their tank configured, and then render whatever the
server tells them about.

## Requirements

* Node.js 0.2.3+
* Coffeescript 0.9.4

## Suggested tools

* Jitter (http://github.com/TrevorBurnham/Jitter)

## Copyright

Copyright © 2010 David Goodlad (david@goodlad.ca)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

