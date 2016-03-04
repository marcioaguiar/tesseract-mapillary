# tesseract-mapillary

Numa discussão na lista OSM Brasil no Telegram, aventou-se a possibilidade de importar para o Mapillary vídeos de motoristas dirigindo no YouTube, após pedir autorização aos autores. Após mandarmos algumas mensagens, um dos usuários a [autorizar a importação de seus vídeos](http://i.imgur.com/Su6V4Q5.png) foi o [Everton Silva](https://www.youtube.com/user/evertonsilva1986/videos). Seus vídeos tem uma camada mostrando a latitude e longitude, o que possibilita a geolocalização das imagens.

Para isso, faz-se necessário digitalizar as imagens, o que faremos com o software tesseract-ocr. Ele necessita ser calibrado com a fonte utilizada.

## Passo a passo

### Instalando dependências

Os comandos assumem um sistema Ubuntu, mas os softwares são multiplataforma.

    sudo apt-get install youtube-dl libav-tools tesseract-ocr imagemagick

### Baixando um vídeo

    youtube-dl https://www.youtube.com/watch?v=Qkg32qsbmC8

### Extraindo os quadros do vídeo (um por segundo)

    mkdir 1
    avconv -i São\ Paulo\ a\ Maceió\ -\ Inicio\ da\ Viagem\ Parte\ 1-Qkg32qsbmC8.mp4 -qscale:v 2 -r 1/1 1/% 03d.jpg

### Cortando a parte com a camada dos dados e o capô do carro

    cd 1
    mkdir crop
    for i in *jpg ; do echo "Convertendo $i" ; convert $i -crop 864x486+208+117 crop/$i ; done

### Cortando as coordenadas

    mkdir coord
    for i in *jpg ; do echo "Convertendo coordenadas $i" ; convert $i -crop [loc] coord/$i ; done

    loc1=183x87+861+21
    loc2=115x65+980+825

### Cortando as datas

    mkdir data
    for i in *jpg ; do echo "Convertendo datas $i" ; convert $i -crop 196x87+1056+21 data/$i ; done
