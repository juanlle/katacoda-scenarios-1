Para empezar vamos a crear un namespace _kubeless_ donde instalar el controlador.

`kubectl create ns kubeless`{{execute}}

Instalamos la versión estable más reciente con el comando `kubectl create`

`kubectl create -f https://github.com/kubeless/kubeless/releases/download/v1.0.0/kubeless-v1.0.0.yaml`{{execute}}

Podemos ver que algunos pods se están iniciando en el espacio de nombres _kubeless_. Por un lado, el controlador que vigilará los objetos función que deban ser creados y también dos Pods para habilitar la función PubSub.

`kubectl get pods -n kubeless`{{execute}}

En cuanto termine de iniciar el controlador, podemos implementar una función. En este ejercicio no es necesario esperar a que se inicien el resto de pods. Las funciones activadas por HTTP están disponibles de forma inmediata.