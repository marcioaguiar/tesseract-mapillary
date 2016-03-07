#!/bin/bash
#
# The MIT License (MIT)
#
# Copyright (c) 2016 Alexandre Magno ‒ alexandre.mbm@gmail.com
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Variables

URL="https://www.youtube.com/watch?v=Qkg32qsbmC8"
DIR="1"
FILE="São Paulo a Maceió - Inicio da Viagem Parte 1-Qkg32qsbmC8.mp4"

DIM="864x486+208+117"
DIM_COORD_VIDEO1="183x87+861+21"
DIM_COORD_VIDEO2="115x65+980+825"
DIM_DATES="196x87+1056+21"

# Check dependencies

function is_ok() {
    which $1 > /dev/null 2>&1
    return $?
}

function passing() {
    is_ok $1 || ( echo "Lacks command: $1" && exit 1 )
}

function dependencies_check()
{
    passing "youtube-dl"
    passing "ffmpeg"
    passing "convert"
}

dependencies_check

# On Arch:
#
# pacman -S youtube-dl
# pacman -S tesseract
# pacman -S imagemagick
# pacman -S ffmpeg
#
# On Ubuntu:
#
# apt-get install youtube-dl
# apt-get install tesseract-ocr
# apt-get install imagemagick
# apt-get install libav-tools

mkdir $DIR

# TODO helper functions

function extract_frames() {  # TODO
    # Extraindo os quadros do vídeo (um por segundo)
    echo
}


function reduce1() {  # cutting data layer and car hood
    cd $DIR
    mkdir crop
    for i in *jpg ; do
        echo "Converting $i"
        convert $i -crop $DIM crop/$i
    done
    cd ..
}

function reduce2() {  # cutting the coordinates area
    cd $DIR
    mkdir coord
    for i in *jpg ; do
        echo "Converting coordinates $i"
        convert $i -crop $1 coord/$i
    done
    cd ..
}

function reduce3() {  # cutting the dates
    cd $DIR
    mkdir time
    for i in *jpg ; do
        echo "Converting dates $i"
        convert $i -crop $DIM_DATES time/$i
    done
    cd ..
}

function crop_frames() {  # TODO
    # call reduce1
    # call reduce2 DIM
    # call reduce3
    # TODO rename the tree functions above?
    echo
}

# TODO main

function download_video() {  # TODO
    echo
}

function adjust_constrast() {  # TODO (optional use)
    # For video 2
    #convert [img] -level 0%,250% [out]
    #convert [out] +level 150%,-250% [final]
    echo
}

function extract_data() {  # TODO
    echo
}

# Parsing parameters

case "$1" in
    info|download|adjust|make|all)
        echo "not implemented"
        ;;
    test)
        reduce3
        ;;
    help)
        echo "not implemented"
        ;;
    *)
        echo
        echo "Options:"
        echo
        echo "  info"
        echo "  download"
        echo "  adjust    (optional)"
        echo "  make"
        echo "  all"
        echo "  help"
        echo
        ;;
esac
