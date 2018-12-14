Veamos el archivo `nginx.yaml` con el siguiente contenido:

<pre class="file">
apiVersion: v1
kind: Service
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  ports:
  - port: 80
    name: web
  clusterIP: None
  selector:
    app: nginx
---
apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: web
spec:
  selector:
    matchLabels:
      app: nginx # debe coincidir con .spec.template.metadata.labels
  serviceName: "nginx"
  replicas: 3 # por defecto es 1
  template:
    metadata:
      labels:
        app: nginx # debe coincidir con .spec.selector.matchLabels
    spec:
      terminationGracePeriodSeconds: 60
      containers:
      - name: nginx
        image: k8s.gcr.io/nginx-slim:0.8
        ports:
        - containerPort: 80
          name: web
        volumeMounts:
        - name: www
          mountPath: /usr/share/nginx/html/test
        readinessProbe:
          httpGet:
            port: 80
          initialDelaySeconds: 30
          periodSeconds: 10
      volumes:
      - name: www
        emptyDir: {}
</pre>

Y desplegamos lo que acabamos de crear:

```
kubectl create -f nginx.yaml
```{{execute}}

Como podemos comprobar en este caso hemos declarado dos objetos en un solo archivo, lo que nos permite desplegarlos juntos.

Ahora comprobemos como se despliegan secuencialmente:

```
watch kubectl get pods
```{{execute}}

Para entrar al terminal de un pod:

```
kubectl exec -it web-0 bash
```{{execute}}

Una vez dentro creamos un archivo `web-0.txt` y salimos del pod:

```
touch /usr/share/nginx/html/test/web-0.txt && exit
```{{execute}}

entramos en el pod y comprobamos si existe el archivo `web-0.txt`

```
kubectl exec -it web-0 -- ls /usr/share/nginx/html/test
```{{execute}}

y comprobamos en otro pod:

```
kubectl exec -it web-0 -- ls /usr/share/nginx/html/test
```{{execute}}
