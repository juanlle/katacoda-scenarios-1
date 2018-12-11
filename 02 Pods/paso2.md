Volvamos a crear otro archivo pod2.yaml con el siguiente contenido:

```
apiVersion: v1
kind: Pod
metadata:
  labels:
    test: liveness
  name: liveness-exec
spec:
  containers:
  - name: liveness
    image: k8s.gcr.io/busybox
    args:
    - /bin/sh
    - -c
    - touch /tmp/healthy; sleep 30; rm -rf /tmp/healthy; sleep 600
    livenessProbe:
      exec:
        command:
        - cat
        - /tmp/healthy
      initialDelaySeconds: 5
      periodSeconds: 5
```
Desplegamos nuestro nuevo pod:

`kubectl apply -f pod2.yaml`{{execute}}

Y comprobamos el despliegue:

`watch kubectl get pod liveness-exec -o wide`{{execute}}

También lo podemos hacer a través del [dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/)

Veremos que los primeros 30 segundos, el pod devolverá un estado correcto ('healthy'), pero al cabo de 35 segundos devolverá un código de error.

Podemos ver la evolución del pod con el comando:

`kubectl describe pod liveness-exec`{{execute}}

Si ejecutáramos el comando y esperáramos unos minutos, comprobaríamos como aumenta el número de reinicios del pod.

**Nota para nerds:** flapping es cuando un pod se reinicia continuamente a causa de un error en el pod.

`watch kubectl get pod liveness-exec -o wide`{{execute}}

Borramos el pod:

`kubectl delete pod liveness-exec`{{execute}}