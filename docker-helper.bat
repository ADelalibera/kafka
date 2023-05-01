::containers em execução
docker ps
<or>
docker container ls

::historico de execução dos containers
docker ps -a

::executar um container
docker run Ubuntu -sleep 1500
<or>
docker container run ubuntu sleep 10

::parar um container em execução pelo 'Names' do container
docker stop compassionate_boh

::acessar container no modo 'interagir' -it
docker run -it ubuntu

::dentro do container 'ubuntu' - executar comando linux
cat /etc/*release*

::Executar container em background e retornar o ID do container
docker run -dti ubuntu
>eba37b49a57e3df858e60d139350e806bbdfae7fcc73dd2c25018800345f2566
>CONTAINER ID
>eba37b49a57e

::acessar um container (by ID) no modo interativo e executar um comando bash
docker exec -it eba37b49a57e /bin/bash

::para instalar o nano precisa atualizar as dependencias/repositorios do ubuntu
apt update

::para confirmar atualização das dependencias/repositorios do ubuntu
apt upgrade -y

:: instalar o nano editor
apt -y install nano

:: testar o nano
nano arquivo.txt
>ctrl+x -> sair do nano

:: sair do bash do container linux (exit)
root@eba37b49a57e:/# exit
ale@Vostro:~$

:: executar um outro comando no container linux
docker exec -it eba37b49a57e cat /etc/*release*

::parar o container (by ID = eba37b49a57e) que está em execução
docker stop eba37b49a57e
>eba37b49a57e

::remover container (by ID = eba37b49a57e) que não serão mais utilizados
docker rm eba37b49a57e

::executar imagem do ubuntu atribuindo o valor de [Name] = 'Ubuntu-A' no container
docker run -dti --name Ubuntu-A ubuntu

::executar o 'bash' no container 'Ubuntu-A'
docker exec -ti Ubuntu-A /bin/bash

::criar diretorio 'destino' dentro do console do Ubuntu-A
mkdir destino
::remover diretorio 'destino' dentro do console do Ubuntu-A
rm -R destino

::criar diretorio 'destino' fora do console do Ubuntu-A
docker exec Ubuntu-A mkdir /destino

::listar diretorios no root '/' fora do console do Ubuntu-A
docker exec Ubuntu-A ls /

::copiar arquivo do host para o container Ubuntu-A (fora do container)
>c:\temp\docker-helper.bat (host)
docker cp docker-helper.bat Ubuntu-A:/destino

::verificar a copia do arquivo 'docker-helper.bat' para o container Ubuntu-A (fora do container)
docker exec Ubuntu-A ls /destino -l

::acessar o bash no container Ubuntu-A
docker exec -ti Ubuntu-A /bin/bash

::copiar arquivo do container Ubuntu-A para maquina host (alterando a extensão)
docker cp Ubuntu-A:/destino/docker-helper.bat docker-helper.copia

::baixar uma imagem do 'debian' com uma 'tag' específica (tag:9) no site do Docker
docker pull debian:9

::executar uma imagem do 'debian' com uma 'tag' específica (tag:9)
docker run -dti --name Debian-A debian:9

::parar um container pelo nome
docker stop Debian-A

::remover um container pelo nome
docker rm Debian-A

::remover uma imagem pelo image_id
docker rmi 662c05203bab -f

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::Criar um container com base na imagem do ubuntu e instalar os softwares python3 e nano
docker run -dti --name ubuntu-python ubuntu
docker exec -ti ubuntu-python /bin/bash
apt update
apt install -y python3 nano
apt clean
::criar um simples programa em python (app.py)
cd opt/
nano app.py
-------------------------------------
nrCPF = input("Informe o seu CPF: ")
print (nrCPF)
-------------------------------------
::executar o programa 'app.py' dentro do container
python3 app.py
::executar o programa 'app.py' fora do container (maquina host)
docker exec -ti ubuntu-python python3 /opt/app.py
::parar e remover container 'ubuntu-python'
docker stop ubuntu-python
docker rm ubuntu-python
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::criar uma imagem com o dockerfile pelo docker build
::criar a pasta '\images\ubuntu-python' no diretorio C:\Docker
C:.
└───Docker
    └───images
        └───ubuntu-python
::criar um simples programa em python (app.py) com o notepad
-------------------------------------
nrCPF = input("Informe o seu CPF: ")
print (nrCPF)
-------------------------------------
::criar um arquivo com nome de 'dockerfile' e inserir os comandos
-------------------------------------
FROM ubuntu
RUN apt update && apt install -y python3 nano && apt clean
COPY app.py /opt/app.py
CMD python3 /opt/app.py
-------------------------------------
::realizar o build do arquivo 'dockerfile'
docker build . -t ubuntu-python

::executar o programa 'app.py' fora do container (maquina host) na imagem ubuntu-python
docker run -ti --name app.py ubuntu-python


