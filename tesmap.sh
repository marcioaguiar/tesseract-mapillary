#!/bin/bash

# Tudo será em inglês? Por enquanto assumo que sim. Esses comentários em português são apenas um esqueleto inicial.

# TODO importar variáveis com "source"?

# TODO licença (somente comentário)

# TODO descrição (somente comentário)

# Check dependencies

function is_ok() {
    which $1 > /dev/null 2>&1
    return $?
}

function passing() {
    is_ok $1 || ( echo "Lacks dependency: $1" && exit 1 )
}

function dependencies_check()
{
    passing "youtube-dl"
    passing "ffmpeg"
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

# TODO funções auxiliares

function extract_frames() {  # TODO
    # Extraindo os quadros do vídeo (um por segundo)
    echo
}

function reduce1() {  # TODO
    # Cortando a parte com a camada dos dados e o capô do carro
    echo
}

function reduce2() {  # TODO
    # Cortando as coordenadas
    echo
}

function reduce3() {  # TODO
    # Cortando as datas
    echo
}

function crop_frames() {  # TODO
    # call reduce1
    # call reduce2
    # call reduce3
    
    # TODO renomear as três funcões acima, se for o caso
    echo
}

# TODO funções principais

function download_video() {  # TODO
    echo
}

function adjust_constrast() {  # TODO (optional use)
    echo
}

function extract_data() {  # TODO
    echo
}

# TODO parsing

# info
# download
# adjust (optional)
# make
# all
# help
