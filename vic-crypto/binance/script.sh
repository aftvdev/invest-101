#!/bin/bash
API=OGxhG9JwWtzqIrHPxvDTj9EOmssruhJMpt4snOcnMdIkq5AGUGDAqNZ8tQ20m488
SECRET=avUgIzJsriVasvpMM2sgwen3jdWj8PD0E4q2fMK6B1eYlegQWyJDKNooE7Hb66mL
curl -H "X-MBX-APIKEY: $API" -s -X $@
#curl -H "X-MBX-APIKEY: $API" -X POST 'https://api.binance.com/api/v3/order?symbol=LTCBTC&side=BUY&type=LIMIT&timeInForce=GTC&quantity=1&price=0.1&recvWindow=5000&timestamp=1499827319559&signature=c8db56825ae71d6d79447849e617115f4a920fa2acdcab2b053c4b2838bd6b71'

