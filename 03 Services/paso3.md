Vamos un nuevo pod con el contenido:

<pre class="file">
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    app: nginx
spec:
  containers:
    - name: nginx-container
      image: nginx:1.7.9
      ports:
      # Ahora los nombramos
      - name: http
        hostPort: 80
        containerPort: 80
      - name: https
        hostPort: 443
        containerPort: 80
</pre>

y otro servicio:

<pre class="file">
kind: Service
apiVersion: v1
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx # Pod al que enrutará este servicio
  type: LoadBalancer
  ports:
  - name: http
    protocol: TCP
    port: 80
    targetPort: http # nombre del puerto en el pod
  - name: https
    protocol: TCP
    port: 443
    targetPort: https
</pre>

desplegamos ambos objetos:

```
kubectl apply -f service3.yaml -f pod2.yaml
```{{execute}}

Comprobamos lo que acabamos de desplegar:

```
kubectl get svc && kubectl get pod
```{{execute}}

De nuevo accedemos al servicio `nginx-service` a traves de su `CLUSTER_IP` y los dos puertos definidos en el servicio con:

```
export CLUSTER_IP=$(kubectl get svc --namespace default nginx-service -o jsonpath="{.spec.clusterIP}")
curl -v $CLUSTER_IP:80
```{{execute}}

 y
 
 ```
curl -v $CLUSTER_IP:443
 ```{{execute}}

Para exponer los puntos de acceso `ENDPOINTS` en minikube, ejecutar el comando:

```
minikube service nginx-service
```{{execute}}

Y tendremos acceso desde el exterior. 

Ya podemos limpiar nuestro cluster:

```
kubectl delete -f service3.yaml -f pod2.yaml
```{{execute}}
