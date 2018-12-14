Veamos el archivo `deployment1.yaml` con el siguiente contenido:

<pre class="file">
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2 # le dice al deployment que ejecute 2 pods como se define en template
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.7.9
        ports:
        - containerPort: 80
</pre>

Ahora desplegamos el deployment que acabamos de mostrar:

```
kubectl create -f deployment1.yaml  --save-config
```{{execute}}

Comprobamos el despliegue por terminal:

```
watch kubectl get deployment
```{{execute}}

Cuando este desplegado correctamente (2 réplicas disponibles), para ver la información del deployment ejecutamos:

```
kubectl describe deployment nginx-deployment
```{{execute}}

Listamos los pods creados por nuestro deployment

```
kubectl get pods -l app=nginx
```{{execute}}

Y mostramos la información de un pod:

```
kubectl describe pod <nombre_del_pod>
```

donde `<nombre_del_pod>` es el nombre de uno de nuestros pods.