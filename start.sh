#!/bin/bash

/vncserver.sh & /shot.rb & /chrome.rb $1 & cd /data/web && rackup -p 80
