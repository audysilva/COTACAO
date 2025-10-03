#!/bin/bash
# data_out=$(date +%Y%m%d)
data_in=$(date +"%d%m%Y")
# curl --proxy proxy.saint-gobain.net:8080 https://www.bna.com.ar/Personas -o ./moedas_arg.txt && sed '/<td>/w filtro1.txt' moedas_arg.txt
curl https://www.bna.com.ar/Personas -o ./moedas_arg.txt && sed '/<td>/w filtro1.txt' moedas_arg.txt
sed '1,16 w filtro2.txt' filtro1.txt && sed 's/.*<td>//w filtro3.txt' filtro2.txt
sed 's/<.*//w filtro4.txt' filtro3.txt && sed 'N ; s/\n/;/w /home/aldemir/COTACAO/cotacao_argentina_'$data_in'.txt' filtro4.txt
# sleep 10
rm moedas_arg.txt filtro1.txt filtro2.txt filtro3.txt filtro4.txt
# done
