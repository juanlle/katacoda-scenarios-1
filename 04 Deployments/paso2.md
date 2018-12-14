Se puede actualizar un deployment si desplegamos un nuevo YAML con:

<pre class="file">
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.8 # Actualizamos la versión de nginx de 1.7.9 a 1.8
        ports:
        - containerPort: 80
</pre>

Para actualizar el deployment:

```
kubectl apply -f deployment2.yaml
```{{execute}}

Y comprobamos como el deployment crea nuevos pods con los nuevos nombres y elimina los antiguos:

```
watch kubectl get pods -l app=nginx
```{{execute}}
