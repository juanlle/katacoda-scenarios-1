En este caso necesitaremos crear un pod además del servicio. Veamos el archivo `pod1.yaml` con el siguiente contenido:

<pre class="file">
apiVersion: v1
kind: Pod
metadata:Con el editor de texto o directamente desde el terminal, crear u
  name: nginx
  labels:
    app: nginx
spec:
  containers:
    - name: nginx-container
      image: nginx:1.7.9
      ports:
      - containerPort: 80
</pre>

y un servicio `service1.yaml`

<pre class="file">
kind: Service
apiVersion: v1
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx # Pod al que enrutará este servicio
  ports:
  - name: http
    protocol: TCP
    port: 80
</pre>

Ahora desplegamos el pod y el servicio que acabamos de mostrar:

```
kubectl create -f pod1.yaml -f service1.yaml
```{{execute}}

Comprobamos lo que acabamos de desplegar:
```
kubectl get pods
```{{execute}}
y
```
kubectl get svc
```{{execute}}

Una vez se ha desplegado, podemos acceder al servicio `nginx-service` a traves de su `CLUSTER_IP` y puerto con:
```
export CLUSTER_IP=$(kubectl get svc --namespace default nginx-service -o jsonpath="{.spec.clusterIP}")
curl -v $CLUSTER_IP:80
```{{execute}}

Y veremos por pantalla el html que devuelve el pod `nginx`

Comprobemos nuestro servicio en detalle:
```
kubectl describe svc nginx-service
```{{execute}}
o también:
```
kubectl get svc nginx-service -o yaml
```{{execute}}
Ahora borramos el servicio del cluster:
```
kubectl delete svc nginx-service
```{{execute}}
Si volvieramos a ejecutar el comando curl anterior, veríamos que ya no tenemos acceso al pod.
```
curl -v $CLUSTER_IP:80
```{{execute}}
