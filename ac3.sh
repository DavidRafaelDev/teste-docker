#!/bin/bash
function baixando_java() {
        echo "[David help]:Verificando se temos java instalado!"

        java -version

        if [ $? -eq 0 ]; then
                echo "[David help]:Ok, Você ja tem o Java instalado! vamos para o proximo passo."
        else
                echo "[David help]:Sua maquina não tem java você gostaria de instalar java ? (S/N)?"

                read inst

                if [ "$inst" == "s" ]; then
                        echo "[David help]:Ok! Vamos instalar o Java!"
                        sleep 2
                        sudo add-apt-repository ppa:webupd8team/java -y
                        sleep 2
                        sudo apt install default-jre apt install openjdk-11-jre-headless -y
                else
                        echo "[David help]: Sem java não podemos continuar!"
                        exit
                fi
        fi
}


function clone() {
        echo "[David help]:Vamos verificar se você tem o git em sua máquina."
        sleep 2
        git --version

        if [ $? -eq 0 ]; then
                echo "[David help]:Com o git instalado vamos clonar o repositorio para rodar nossa aplicação."
                git clone https://github.com/DavidRafaelDev/Ac3-Sistemas-Operacionais.git
        else
                echo "[David help]:Você não tem o git instalado!"
                echo "[David help]:Gostaria de baixar o git (S/N)?"

                read inst

                if [ "$inst" == "s" ]; then
                        echo "[David help]:Instalando git"
                        sleep 2
                        sudo apt-get install git-all
                        echo "[David help]:Clonando repositorio."
                        sleep 2
                        git clone https://github.com/DavidRafaelDev/Ac3-Sistemas-Operacionais.git
                else
                        echo "[David help]:Sem git não podemos continuar !"
                        exit
                fi
        fi
}

function docker() {
        echo "[David help]:Vamos verificar se você tem o docker em sua máquina."

        docker --version

        if [ $? -eq 0 ]; then
                sleep 2
                cd Ac3-Sistemas-Operacionais
                sleep 2
                echo "[David Help]: Criando container"
                sudo docker built -t containerAc3 .
                sleep 2
                echo "[David help]: Container criado hora de rodar ele"
                sudo docker run containerAc3

        else
                echo "[David help]:Docker não encontrado em sua maquina, gostaria de baixa-lo (S/N)?"

                read inst

                if [ "$inst" == "s" ]; then
                        echo "[David help]:Ok, vamos baixar o docker."
                        sleep 1
                        sudo apt install docker.io
                        sleep 1

                        echo "[David help]:Pronto, Docker instaldo com sucesso!"
                        echo "[David help]:Vamos inicia-lo e baixar a imagem do mysql."
                       sleep 2
                        cd Ac3-Sistemas-Operacionais
                        sleep 2
                        echo "[David Help]: Criando container"
                        sudo docker built -t containerAc3 .
                        sleep 2
                        echo "[David help]: Container criado hora de rodar ele"
                        sudo docker run containerAc3
                        else
                        echo "[David help]:Sem o docker não podemos continuar!"
                        exit
                fi
        fi
}



#A proxima função é a função main, da qual tera a função de chamar todas as outras funções e fazer tudo funcionar.

function main() {
        echo "[David help]:Olá, vamos iniciar o script de avaliação da AC3."
        sleep 1
        baixando_java
        clone
        docker
}
main