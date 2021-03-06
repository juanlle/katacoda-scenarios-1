En este caso usaremos el mismo pod creado previamente, y un nuevo servicio `service2.yaml` con el contenido:

<pre class="file">
kind: Service
apiVersion: v1
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx # Pod al que enrutará este servicio
  type: NodePort
  ports:
    - name: http
      protocol: TCP
      port: 8080
      targetPort: 80
</pre>

Ahora desplegamos el servicio que acabamos de crear:

```
kubectl apply -f service2.yaml
```{{execute}}

Comprobamos el servicio que acabamos de desplegar:

```
kubectl get svc
```{{execute}}

Anotamos los dos puertos de nuestro servicio. De nuevo accedemos al servicio `nginx-service` a traves de su `CLUSTER_IP` y puerto con:

```
export CLUSTER_IP=$(kubectl get svc --namespace default nginx-service -o jsonpath="{.spec.clusterIP}")
curl -v $CLUSTER_IP:8080
```{{execute}}

Ahora obtenemos la dirección IP del cluster con el comando:

```
kubectl cluster-info
```{{execute}}

Si probamos acceder a la IP que acabamos de obtener a través del segundo puerto de nuestro servicio, veremos que también accedemos al pod:

```
export NODE_PORT=$(kubectl get svc --namespace default nginx-service -o jsonpath="{.spec.ports[0].nodePort}")
curl -v [[HOST_IP]]:$NODE_PORT
```{{execute}}

Ahora borramos el servicio del cluster:
```
kubectl delete svc nginx-service
```{{execute}}

y el pod:
```
kubectl delete pod nginx
```{{execute}}
