#!/bin/bash

DIRETORIO_PROJETO="/home/projel/projel-produtividade-teste"

cd $DIRETORIO_PROJETO

npm run build

cp /home/projel/.env-homologacao-backup $DIRETORIO_PROJETO/build/.env

mkdir -p $DIRETORIO_PROJETO/build/analysis

cp $DIRETORIO_PROJETO/analysis/production_report.py $DIRETORIO_PROJETO/build/analysis

pm2 restart teste