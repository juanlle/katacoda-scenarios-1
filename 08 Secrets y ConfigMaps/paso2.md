Para arrancar minikube en nuestra máquina virtual hay que ejecutar:

`minikube start`{{execute}}

Comprobar el estado del despliegue de minikube:

`minikube status`{{execute}}

Y comprobamos que el demonio de docker se comunica con el demonio de docker dentro de la máquina virtual de minikube:

`docker ps`{{execute}}