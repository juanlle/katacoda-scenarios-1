Con el editor de texto o directamente desde el terminal, creamos un archivo de texto:

`echo "this is my new password" > password.txt`{{execute}}

y un archivo `secret.yaml` con ese archivo de texto:

`kubectl create secret generic newpass --from-file=password.txt`{{execute}}

Comprobamos lo que hemos creado

`kubectl describe secret newpass`{{execute}}

deberíamos obtener algo similar a:
```
Name:           newpass
Namespace:      default
Labels:         <none>
Annotations:    <none>

Type:   Opaque

Data
====
password.txt:  24 bytes
```
Si visualizamos el secret veremos que el valor esta encriptado en base64

`kubectl get secret newpass -o yaml`{{execute}}

Ya podemos crear un `pod2.yaml` con el siguiente contenido:

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
    image: centos:7
    command: ['sh', '-c', 'echo I am ready && sleep 3600']
    volumeMounts:
      - name: passvol
        mountPath: "/tmp/newpass"
        readOnly: true
  volumes:
  - name: passvol
    secret:
        secretName: newpass
```
desplegamos el pod que acabamos de crear:

`kubectl create -f pod2.yaml`{{execute}}

y comprobamos que ha arrancado correctamente

`kubectl logs myapp-pod`{{execute}}

y comprobamos que el archivo creado a partir del secret existe en el pod

`kubectl exec -it myapp-pod cat /tmp/newpass/password.txt

Salida del terminal:
```
this is my new password
```
Ya podemos eliminar el pod:

`kubectl delete -f pod2.yaml`{{execute}}
