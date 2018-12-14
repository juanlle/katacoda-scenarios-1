Veamos el archivo `replicaset1.yaml` con el siguiente contenido:

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
            cpu: 10m
            memory: 10Mi
        env:
        - name: GET_HOSTS_FROM
          value: dns
        ports:
        - containerPort: 80
        readinessProbe:
          httpGet:
            port: 80
</pre>

y un servicio `service1.yaml`

<pre class="file">
kind: Service
apiVersion: v1
metadata:
  name: frontend-service
spec:
  selector:
    app: guestbook # RS al que enrutará este servicio
  type: LoadBalancer
  ports:
  - name: http
    protocol: TCP
    port: 80
</pre>

desplegamos lo que acabamos de crear:

```
kubectl create -f replicaset1.yaml -f service1.yaml
```{{execute}}

Si lo deseamos podemos comprobar que se puede acceder desde internet

```
minikube service frontend-service
```{{execute}}
