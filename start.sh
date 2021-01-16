#!/bin/bash

. $IDF_PATH/export.sh

script_path=$(dirname $(realpath -s $0))

mvim -u $script_path/vimrc
