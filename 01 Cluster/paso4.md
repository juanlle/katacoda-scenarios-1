Ahora usaremos el comando `kubectl run`  para realizar un despliegue sencillo con un único pod.

`kubectl run hello-node --image=gcr.io/hello-minikube-zero-install/hello-node --port=8080`{{execute}}

Comprobamos el despliegue:

`kubectl get deployments`{{execute}}

Comprobamos el pod:

`kubectl get pods`{{execute}}

Comprobamos los eventos del clúster:

`kubectl get events`{{execute}}

Comprobamos los nodos del clúster:

`kubectl get nodes -o wide`{{execute}}

Comprobamos la configuración de 'kubectl':

`kubectl config view`{{execute}}

**Nota:** Para mas información sobre los comandos de `kubectl` ir al [manual](https://kubernetes.io/docs/user-guide/kubectl-overview/) online.
