#!/bin/bash

/vncserver.sh & /shot.rb & /chrome.sh $1 & cd /data/web && rackup -p 80
