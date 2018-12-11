Otro tipo de sondas usan solicitudes HTTP GET.

Pasemos a crear o editar nuestro archivo `pod3.yaml` con el contenido

```
apiVersion: v1
kind: Pod
metadata:
  labels:
    test: liveness
  name: liveness-http
spec:
  containers:
  - name: liveness
    image: k8s.gcr.io/liveness
    args:
    - /server
    livenessProbe:
      httpGet:
        path: /healthz
        port: 8080
        httpHeaders:
        - name: X-Custom-Header
          value: Awesome
      initialDelaySeconds: 3
      periodSeconds: 3
```
y desplegamos de nuevo el pod:

`kubectl apply -f pod.yaml`{{execute}}
 
En el caso de las sondas HTTP, cualquier código mayor o igual a 200 y menor de 400 indicará un estado correcto o exitoso. Cualquier otro valor indicará un estado erróneo o fallido.
 
En este ejemplo durante los primeros 10 segundos el pod estará 'vivo', `/healthz` devolverá un código 200. Después de esto devolverá un código de estado 500.

Comprobamos:

`watch kubectl get pod liveness-http -o wide`{{execute}}

y también

`kubectl describe pod liveness-http`{{execute}}

Las sondas HTTP poseen campos adicionales que pueden ser establecidos en `httpGet`:

`host`, `scheme`, `path`, `httpHeaders`, `port`

Una vez hemos terminado, eliminamos el pod:

`kubectl delete pod liveness-http`{{execute}}
