#!/bin/bash
# data_out=$(date +%Y%m%d)
data_in=$(date +"%d%m%Y")
# curl https://si3.bcentral.cl/Siete/ES/Siete/Cuadro/CAP_TIPO_CAMBIO/MN_TIPO_CAMBIO4/TCB_510_PARIDADES/TCB_510
# [curl --proxy proxy.saint-gobain.net:8080 https://si3.bcentral.cl/Siete/ES/Siete/Cuadro/CAP_TIPO_CAMBIO/MN_TIPO_CAMBIO4/TCB_520_TIPO_CAMBIO_NOMINAL/TCB_520 -o ./filtro_chi.txt && sed '/Brasil: Real/w filtro1_chi.txt' filtro_chi.txt
curl https://si3.bcentral.cl/Siete/ES/Siete/Cuadro/CAP_TIPO_CAMBIO/MN_TIPO_CAMBIO4/TCB_520_TIPO_CAMBIO_NOMINAL/TCB_520 -o ./filtro_chi.txt && sed '/Brasil: Real/w filtro1_chi.txt' filtro_chi.txt
awk '/Brasil: Real/, /tr/' filtro_chi.txt > cota_bra.txt
awk '/Estados Unidos:/, /tr/' filtro_chi.txt > cota_usa.txt
awk '/Eurozona/, /tr/' filtro_chi.txt > cota_eur.txt
awk '/Argentina: Peso argentino/, /tr/' filtro_chi.txt > cota_arg.txt
awk '/Reino Unido: Libra esterlina/, /tr/' filtro_chi.txt > cota_gbp.txt
awk '/Polonia: Zloty/, /tr/' filtro_chi.txt > cota_pln.txt
sed 's/<td class="ar col">/ /' cota_bra.txt | awk -F "<" '{print $1}' | grep '[0-9]' | tr [:blank:] : | sed 's/:*:/M CLP BRL /' | tail -1 > /home/aldemir/COTACAO/cotacao_chile_$data_in.txt
sed 's/<td class="ar col">/ /' cota_usa.txt | awk -F "<" '{print $1}' | grep '[0-9]' | tr [:blank:] : | sed 's/:*:/M CLP USD /' | tail -1 >> /home/aldemir/COTACAO/cotacao_chile_$data_in.txt
sed 's/<td class="ar col">/ /' cota_eur.txt | awk -F "<" '{print $1}' | grep '[0-9]' | tr [:blank:] : | sed 's/:*:/M CLP EUR /' | tail -1 >> /home/aldemir/COTACAO/cotacao_chile_$data_in.txt
sed 's/<td class="ar col">/ /' cota_arg.txt | awk -F "<" '{print $1}' | grep '[0-9]' | tr [:blank:] : | sed 's/:*:/M CLP ARS /' | tail -1 >> /home/aldemir/COTACAO/cotacao_chile_$data_in.txt
sed 's/<td class="ar col">/ /' cota_gbp.txt | awk -F "<" '{print $1}' | grep '[0-9]' | tr [:blank:] : | sed 's/:*:/M CLP GBP /' | tail -1 >> /home/aldemir/COTACAO/cotacao_chile_$data_in.txt
sed 's/<td class="ar col">/ /' cota_pln.txt | awk -F "<" '{print $1}' | grep '[0-9]' | tr [:blank:] : | sed 's/:*:/M CLP PLN /' | tail -1 >> /home/aldemir/COTACAO/cotacao_chile_$data_in.txt
# sleep 30
rm cota_bra.txt cota_usa.txt cota_eur.txt cota_arg.txt filtro_chi.txt filtro1_chi.txt cota_gbp.txt cota_pln.txt
#done
