#!/bin/bash
data_out=$(date +%Y%m%d)
data_in=$(date +"%d%m%Y")
wget 'https://www4.bcb.gov.br/Download/fechamento/'$data_out'.csv' -O '/home/aldemir/COTACAO/cotacao_brasil_'$data_in'.txt'
wget 'https://www4.bcb.gov.br/Download/fechamento/'20231018'.csv' -O '/home/aldemir/COTACAO/cotacao_brasil_'18102023'.txt'
# done
