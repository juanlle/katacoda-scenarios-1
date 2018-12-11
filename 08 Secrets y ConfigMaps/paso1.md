Con el editor de texto o directamente desde el terminal, creamos un archivo de texto:

`echo "All you need is Love!" > slogan.txt`{{execute}}

y un archivo `configmap.yaml` con ese archivo de texto:

`kubectl create configmap orange --from-file=slogan.txt`{{execute}}

Comprobamos lo que hemos creado

`kubectl describe configmap orange`{{execute}}

```
Name:           orange
Namespace:      default
Labels:         <none>
Annotations:    <none>

Data
====
slogan.txt:
----
All you need is Love!

Events: <none>
```

Ya podemos crear un `pod1.yaml` con el siguiente contenido:

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
      command: ['sh', '-c', 'echo I am ready && sleep 3600']
      env:
        # Define the environment variable
        - name: ORANGE
          valueFrom:
            configMapKeyRef:
              name: orange
              key: slogan.txt
```

desplegamos el pod que acabamos de crear:

`kubectl create -f pod1.yaml`{{execute}}

y comprobamos que la variable de entorno creada a partir del configmap existe en el pod

`kubectl exec -it myapp-pod env | grep ORANGE`{{execute}}

```
ORANGE=All you need is Love!
```

Ya podemos eliminar el pod:

`kubectl delete -f pod1.yaml`{{execute}}