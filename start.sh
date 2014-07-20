#!/bin/bash

/vncserver.sh & $(sleep 10; /shot.sh) & /chrome.sh $1 & cd /data/web && rackup -p 80
