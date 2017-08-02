#! /bin/bash
sudo docker build -t mysql-test .
if [ $# -eq 0 ]
  then
    echo "Sem argumentos"
    sudo docker run --name banco -d -v "$(pwd)"/MySQL_Files:/var/lib/mysql mysql-test
    ./dbash.sh banco
  else
    sudo docker run --name $1 -d -v "$(pwd)"/MySQL_Files:/var/lib/mysql mysql-test
    ./dbash.sh $1
fi



