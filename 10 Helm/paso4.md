Helm despliega todos los pods, replication controllers y servicios. El pod estará en el estado _pending_ mientras se descarga la imagen de Docker y hasta que esté disponible un volumen persistente. Una vez completado, su estado cambiará a _running_. Ahora tendrás un clúster Redis corriendo sobre Kubernetes.

Use _kubectl_ para ver lo que se ha desplegado.

`kubectl get pods`{{execute}}

`kubectl get deploy`{{execute}}

`kubectl get svc`{{execute}}
