#!/bin/sh

if [ -n "$BACKEND" ]; then
sed -i "s/localhost:8080/$BACKEND:31337/" priv/www/index.js
else
echo "BACKEND variable not set. Frontend will try connect to ws://localhost:8080"
fi
erl -pa app/default/lib/cowboy/ebin/ app/default/lib/cowlib/ebin/ app/default/lib/ranch/ebin/ app/default/lib/websocket_chat/ebin/ app/default/lib/jsx/ebin/ -s websocket_chat_app fast_start -noshell


