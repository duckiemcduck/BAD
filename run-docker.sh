#! /bin/bash
sudo docker build -t mysql-test .
sudo docker run -v "$(pwd)"/MySQL_Files:/var/lib/mysql mysql-test

