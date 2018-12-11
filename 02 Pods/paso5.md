Los initContainer son contenedores que se ejecutan de forma secuencial y hasta terminación antes de ejecutar los contenedores del pod.

Pasemos a crear o editar nuestro archivo `pod5.yaml` con el contenido

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
    command: ['sh', '-c', 'echo The app is running! && sleep 3600']
  initContainers:
  - name: init-myservice
    image: busybox
    command: ['sh', '-c', 'until nslookup myservice; do echo waiting for myservice; sleep 2; done;']
  - name: init-mydb
    image: busybox
    command: ['sh', '-c', 'until nslookup mydb; do echo waiting for mydb; sleep 2; done;']
```
y desplegamos de nuevo el pod:

`kubectl apply -f pod5.yaml`{{execute}}

Comprobamos:

`watch kubectl get pods -o wide`{{execute}}

y vemos que no termina de desplegar el pod, ya que el initContainer esta esperando a tener conexión con `myservice` y con `mydb`.
```
NAME        READY     STATUS     RESTARTS   AGE
myapp-pod   0/1       Init:0/2   0          6m
```
Creamos un nuevo archivo `service.yaml` con el contenido:
```
kind: Service
apiVersion: v1
metadata:
  name: myservice
spec:
  ports:
  - protocol: TCP
    port: 80
    targetPort: 9376
---
kind: Service
apiVersion: v1
metadata:
  name: mydb
spec:
  ports:
  - protocol: TCP
    port: 80
    targetPort: 9377
```
y lo desplegamos

`kubectl apply -f service.yaml`{{execute}}

y volvemos a comprobar:

`watch kubectl get pods -o wide`{{execute}}

también podemos comprobar los servicios:

`watch kubectl get svc -o wide`{{execute}}

Veremos que una vez los servicios se despliegan, el pod consigue levantarse correctamente.
```
NAME        READY     STATUS    RESTARTS   AGE
myapp-pod   1/1       Running   0          9m
```
