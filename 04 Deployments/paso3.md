Podemos aumentar el número de réplicas en nuestro deployment, si modificamos el valor y aplicamos el YAML. En nuestro caso aumentaremos el valor de `replicas` a 4:

<pre class="file">
apiVersion: apps/v1 # for versions before 1.9.0 use apps/v1beta2
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 4 # Update the replicas from 2 to 4
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.8
        ports:
        - containerPort: 80
</pre>

Actualizamos

```
kubectl apply -f deployment3.yaml
```{{execute}}

y comprobamos

```
watch kubectl get pods -l app=nginx
```{{execute}}
