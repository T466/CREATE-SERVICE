#!/bin/bash
clear
echo; echo ------ CREATE SERVICE -------
echo

echo Digite o nome do script
echo Ex - backup.sh

echo; echo Scripts do /opt logo abaixo
echo; ls -l /opt

echo; read progsh; echo

echo Digite o nome do Programa
echo Ex - Backup
echo; read nomeprog
echo

echo Digite o nome do servico a executar
echo Ex - backup
echo; read nomeservico
echo

mkdir /tmp/NAME-SERVICE
cd /opt/CREATE-SERVICE
cp -r name-service /tmp/NAME-SERVICE

sed -i 's/PPROGRAMA.SH/'$progsh'/' /opt/CREATE-SERVICE/name-service

sed -i 's/PPrograma/'$nomeprog'/' /opt/CREATE-SERVICE/name-service

cd /opt/CREATE-SERVICE/
cp -r name-service /tmp
cd /tmp
mv name-service $nomeservico
mv $nomeservico /opt/CREATE-SERVICE/

cd /opt/CREATE-SERVICE/
rm -fr name-service
cd /tmp/NAME-SERVICE
mv name-service /opt/CREATE-SERVICE/
cd /tmp
rm -fr NAME-SERVICE

clear

echo; echo; echo CRIANDO SERVIÇO
echo
sleep 6
echo CRIANDO REPOSITORIO DE INSTALACAO
echo
cd /
sleep 8
echo CONFIGURANDO ARQUIVOS DE INSTALACAO DO $nomeservico
echo; cd /opt
cp -r  $progsh /usr/local/bin
cd /usr/local/bin
chmod 777 $progsh
sleep 8; echo CONFIGURANDO O SERVICO $nomeservico
echo
cd /opt/CREATE-SERVICE/
cp -r $nomeservico /etc/init.d/
cd /etc/init.d
chmod +x $nomeservico
sleep 8; clear
cd /opt/CREATE-SERVICE
rm -fr $nomeservico

echo; echo
echo INSTALACAO FINALIZADA
echo; echo PARA VERIFICAR O STATUS DO SERVICO EXECUTE:
echo; echo service $nomeservico status
echo; sleep 10
echo
echo Enter para Sair
read a
