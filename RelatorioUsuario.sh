#!/bin/bash

#########################################################
#							#
#Desenvolvedor: Jean Henrique				#
#							#
#E-mail: jean.jhenri@gmail.com				#
#							#
#Descrição: O Script gera um relatório com informação   #
#	de um usuário do sistema passado como parâmetro.#
#							#
#Uso: ./ScriptInformacoesUserV2.sh			#
#							#
#########################################################

clear

read -p "Digite o nome do usuário que deseja pesquisar: " usuario

#Verifica se existe o usuário, se não existir irá printar uma mensagem no terminal e parar o script.
ls /home/$usuario > /dev/null 2>&1 || { echo "Usuário Inexistente" ; exit 1; }

#Puxa somente as informações do usuário | Cria uma lista separada por ":" e puxa a terceira coluna.
USERID=$(grep $usuario /etc/passwd | cut -d":" -f3)

#Puxa somente as informações do usuário | Cria uma lista separada por ":" e puxa a quinta coluna onde se encontra a descrição do usuário | Remove as ",".
DESC=$(grep $usuario /etc/passwd | cut -d":" -f5 | tr -d ",")

#Mostra qual o uso do diretório do usuário.
USOHOME=$(du -sh /home/$usuario | cut -f1)

ULTIMOLOGIN=$(lastlog -u $usuario)

clear
echo "===================================================================================================="
echo ""
echo "Relatório do Usuário: $usuario"
echo ""
echo "UID: $USERID"
echo ""
echo "Nome: $DESC"
echo ""
echo "Total usado no /home/$usuario: $USOHOME"
echo ""
echo "Ultimo Login:"
echo "$ULTIMOLOGIN"
echo "===================================================================================================="
exit 0
