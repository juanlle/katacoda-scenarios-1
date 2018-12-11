Con el editor de texto o directamente desde el terminal, crear un archivo `pod1.yaml` con el siguiente contenido:
```
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
  labels:
    app: myapp
spec:
  containers:
    - name: myapp-container
      image: busybox
      command: ['sh', '-c', 'echo All you need is Love! && sleep 3600']
```
Ahora desplegamos el pod que acabamos de crear:

`kubectl create -f pod1.yaml`{{execute}}

o también:

`kubectl apply -f pod1.yaml`{{execute}}

**Nota:** normalmente para crear un objeto en Kubernetes se usa el comando `create` de `kubectl`, pero también se puede usar `apply` que además sirve para actualizar elementos existentes.

Comprobamos el despliegue del pod en el [dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/) (yaml, logs y exec). También podemos hacerlo por terminal:

`watch kubectl get pods`{{execute}}

Para eliminar un pod haciendo referencia al archivo:

`kubectl delete -f pod1.yaml`{{execute}}

Para eliminar un pod haciendo nombre del pod:

`kubectl delete pod myapp-pod`{{execute}}

Para eliminar un pod a la fuerza:

`kubectl delete pod myapp-pod --force --grace-period=0`{{execute}}