### 5. Hello Minikube 2/2

Para exponer el Pod al exterior (internet) usando el comando _kubectl expose_:

`kubectl expose deployment hello-node --type=LoadBalancer`{{execute}}

El parámetro `--type=LoadBalancer` indica que queremos exponer nuestro servicio fuera del cluster.

Comprobamos el servicio que acabamos de crear:

`kubectl get services`{{execute}}

En los proveedores cloud que admiten balanceadores de carga, se asignará una dirección IP externa para acceder al Servicio. En Minikube, el tipo LoadBalancer hace que el Servicio sea accesible a través del comando `minikube service`.

Ejecutar el comando:

`minikube service hello-node`{{execute}}

**Nota:** En la parte superior del terminal web, pulsar sobre el signo mas y luego pulsar en "Select port to view on Host 1". Escribir el segundo puerto después del 8080, y luego pulsar "Display Port". Esto abrirá una ventana del navegador con nuestra app mostrando el mensaje "Hello World".
