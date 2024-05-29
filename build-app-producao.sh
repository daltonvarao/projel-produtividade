#!/bin/bash

DIRETORIO_PROJETO="/home/projel/projel-produtividade"

cd $DIRETORIO_PROJETO

cp -au $DIRETORIO_PROJETO/build/.env /home/projel/.env-producao-backup

yarn install

npm run build

cp /home/projel/.env-producao-backup $DIRETORIO_PROJETO/build/.env

mkdir -p $DIRETORIO_PROJETO/build/analysis

cp $DIRETORIO_PROJETO/analysis/production_report.py $DIRETORIO_PROJETO/build/analysis

pm2 restart server