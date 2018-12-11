El estado de los dos nodos en el clúster ahora debería estar como _Ready_. Esto significa que nuestros despliegues se pueden programar y lanzar.

Usando Kubectl, es posible desplegar pods. Los comandos siempre se emiten al _Master_, y cada _Node_ solo es responsable de ejecutar las cargas de trabajo.

El siguiente comando crea un _Pod_ basado en la imagen de Docker `katacoda/docker-http-server`.

`kubectl run http --image=katacoda/docker-http-server:latest --replicas=1`{{execute HOST1}}

El estado de la creación del Pod se puede ver usando `kubectl get pods`{{execute HOST1}}

Una vez que se ejecuta, puede ver el contenedor Docker ejecutándose en el nodo.

`docker ps | grep docker-http-server`{{execute HOST2}}