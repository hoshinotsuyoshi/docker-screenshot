#!/bin/bash

/vncserver.sh & $(sleep 10; /shot.rb) & /chrome.sh $1 & cd /data/web && rackup -p 80
