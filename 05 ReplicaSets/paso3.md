Si se diera el caso de que nuestros pods no tienen suficientes recursos, podríamos aumentarlos como en el siguiente YAML:

<pre class="file">
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  # modificar el número de replicas a elección
  replicas: 3
  selector:
    matchLabels:
      tier: frontend
    matchExpressions:
      - {key: tier, operator: In, values: [frontend]}
  template:
    metadata:
      labels:
        app: guestbook
        tier: frontend
    spec:
      containers:
      - name: php-redis
        image: gcr.io/google_samples/gb-frontend:v3
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
        env:
        - name: GET_HOSTS_FROM
          value: dns
        ports:
        - containerPort: 80
        readinessProbe:
          httpGet:
            port: 80
</pre>

Y lo actualizamos

```
kubectl apply -f replicaset2.yaml
```{{execute}}

Comprobamos que en efecto han aumentado los recursos

```
kubectl describe rs frontend
```{{execute}}
