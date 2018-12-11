```
echo "All you need is Love!" > slogan.txt
```
y un archivo `configmap.yaml` con ese archivo de texto:
```
kubectl create configmap orange --from-file=slogan.txt
```
Comprobamos lo que hemos creado
```
kubectl describe configmap orange
```
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
Ya podemos crear un `pod.yaml` con el siguiente contenido:
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
```
kubectl create -f pod.yaml
```
y comprobamos que la variable de entorno creada a partir del configmap existe en el pod
```
kubectl exec -it myapp-pod env | grep ORANGE
```
```
ORANGE=All you need is Love!
```
Ya podemos eliminar el pod:
```
kubectl delete -f pod.yaml
```
`kubectl version`{{execute}}

Luego comprobamos _minikube_ con el comando:

`minikube version`{{execute}}

y para asegurarnos que no tenemos un cluster de _minikube_ en marcha:

`minikube status`{{execute}}