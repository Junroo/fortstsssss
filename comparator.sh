#!/bin/bash
#variables for versions
python2=$(python2 --version 2>&1 | egrep -o -m 1 '[0-9]' | head -1)
python3=$(python3 --version 2>&1 | egrep -o -m 1 '[0-9]' | head -1)
#comparation of the versions
if ((python3 > python2))
then echo "$(python3 --version) is better to use"
else echo "$(python2 --version) is better to use"
fi
 
