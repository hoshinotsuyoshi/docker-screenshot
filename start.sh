#!/bin/bash

/vncserver.sh & $(sleep 10; /shot.sh) & /chrome.sh $1
