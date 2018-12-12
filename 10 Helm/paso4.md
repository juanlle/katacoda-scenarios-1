Helm despliega todos los pods, replication controllers y servicios.

Use _kubectl_ para ver lo que se ha desplegado.

`kubectl get all`{{execute}}

El pod estará en el estado _pending_ mientras se descarga la imagen de Docker y hasta que esté disponible un volumen persistente.

`kubectl apply -f pv.yaml`{{execute}}

Redis necesita que le otorguemos los permisos de escritura.
`chmod 777 -R /mnt/data*`{{execute}}

Una vez completado, su estado cambiará a _running_. Ahora tendrás un clúster Redis corriendo sobre Kubernetes.

`kubectl all`{{execute}}

Al despliegue de _Helm_ se le podría dar un nombre más amigable, como:

`helm install --name redis-orange stable/redis`{{execute}}