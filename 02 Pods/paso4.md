Un tercer tipo de sondas utilizan el socket TCP. Con este tipo de configuración, el kubelet (agente del nodo) intentará abrir un socket a su contenedor en el puerto especificado. Si puede establecer una conexión, el contenedor se considera en buen estado, si no se puede lo considerará fallido.

Pasemos a crear o editar nuestro archivo `pod4.yaml` con el contenido

```
apiVersion: v1
kind: Pod
metadata:
  name: goproxy
  labels:
    app: goproxy
spec:
  restartPolicy: OnFailure
  containers:
  - name: goproxy
    image: k8s.gcr.io/goproxy:0.1
    ports:
    # Nota: puertos del pod con nombre
    -  name: liveness-port
       containerPort: 8080
       hostPort: 8080
    # Nota: este pod tiene los dos tipos de sondas
    readinessProbe:
      tcpSocket:
        port: liveness-port
      initialDelaySeconds: 5
      periodSeconds: 10
    livenessProbe:
      tcpSocket:
        port: 8080
      initialDelaySeconds: 15
      periodSeconds: 20
```
y desplegamos de nuevo el pod:

`kubectl apply -f pod4.yaml`{{execute}}
 
Como se puede ver, la configuración para la comprobación TCP es bastante similar a la comprobación HTTP. Este ejemplo usa tanto las sondas `readiness` como `liveness`. El `kubelet` enviará la primera sonda `readiness` 5 segundos después de que se inicie el contenedor. En concreto, intentará conectarse al contenedor goproxy en el puerto 8080. Si la sonda tiene éxito, el pod se marcará como listo (ready). El kubelet continuará ejecutando esta comprobación cada 10 segundos.

Además de la sonda `readiness`, esta configuración incluye una sonda `liveness`. El kubelet ejecutará la primera sonda `liveness` 15 segundos después de que se inicie el contenedor. Al igual que la sonda `readiness`, `kubelet` intentará conectarse al contenedor goproxy en el puerto 8080. Si la sonda falla, el contenedor se reiniciará.

Comprobamos:

`watch kubectl get pod goproxy -o wide`{{execute}}

y también

`kubectl describe pod goproxy`{{execute}}

Una vez hemos terminado, eliminamos el pod:

`kubectl delete pod goproxy`{{execute}}

Además de lo visto en este ejemplo (puertos con nombre, sondas `readiness` y `livenes`), existen otros elementos que nos permiten configurar las sondas:

`initialDelaySeconds` , `periodSeconds`, `timeoutSeconds`, `successThreshold`, `failureThreshold`