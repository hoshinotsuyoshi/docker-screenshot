#!/bin/bash

/vncserver.sh & /chrome-shot.rb $1 & cd /data/web && rackup -p 80
