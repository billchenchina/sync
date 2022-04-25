#!/bin/bash
X=$(< count.txt)
echo $(($X + 1)) > count.txt
