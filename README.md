Fork of https://github.com/Antibiotic/websocket_chat for test.

WebSocket chat
=====
Simple web-chat written on Erlang
and based on WebSockets as transport layer.

Extra goal (not done): do it without cowboy. :)

Build
-----

    $ make compile

Run
---

    $ make start

Requirements
====
- Tested on Ubuntu 18.04
- Installed and configured Salt Master and salt minion. [Installations doc](https://repo.saltstack.com/#ubuntu)

Build docker image
---
    $ docker build -t webchat .
    
Image automatically build from dockerisation branch and push to https://hub.docker.com/r/vilorij/erlang-chat
    
Run docker image
---
    $ docker run -p 31337:8080 -e BACKEND=localhost -d vilorij/erlang-chat
    
If not set BACKEND env, code will search WebSocket service at localhost:8080. So, default running will be
 ```
   $ docker run -P -d vilorij/erlang-chat
```    
    
Deploy with salt
---
Clone repo and copy salt states on your Salt master
```
    $ cp -pr salt/* /srv/salt 
```
After that apply states to your minion
```
    $ salt yourminion states.apply docker
    $ salt yourminion states.apply app
```    
Webchat will listen on http://YOURMINION_IP:31337
    
Possible TODO
---
- Add top.sls for highstate
- Pillar implementation
- Fix working on machine with multiple public network interfaces
