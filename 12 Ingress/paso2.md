El archivo YAML _ingress.yaml_ define un controlador Ingress basado en Nginx junto con un servicio que lo hace disponible en el Puerto 80 para conexiones externas usando ExternalIPs. Si el clúster de Kubernetes se estuviera ejecutando en un proveedor en la nube, usaría un tipo de servicio LoadBalancer.

El _ServiceAccount_ define la cuenta con un conjunto de permisos que definen como el clúster accede a las reglas de ingreso definidas (_Ingress_). El _Secret_ predeterminado del servidor es un certificado autofirmado para las conexiones SSL del ejemplo Nginx y necesario para el [ejemplo predeterminado de Nginx](https://github.com/nginxinc/kubernetes-ingress/tree/master/deployments).

`cat ingress.yaml`{{execute}}

### Tarea

Los controladores _Ingress_ se despliegan de manera similar a otros objetos en Kubernetes: `kubectl create -f ingress.yaml`{{execute}}

Podemos comprobar su estado usando `kubectl get deployment -n nginx-ingress`{{execute}}