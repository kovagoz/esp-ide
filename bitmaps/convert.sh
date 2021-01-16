#!/bin/bash

convert -channel rgba -background "rgba(0,0,0,0)" $1 -resize 200x200 -gravity center -extent 300x300 $2
