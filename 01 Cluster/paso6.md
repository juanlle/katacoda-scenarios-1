### 6. Habilitar addons

Minikube posee una lista de addons que pueden ser habilitados, deshabilitados y ejecutados en el entorno local de Kubernetes.

Para mostrar la lista de los addons soportados:

`minikube addons list`{{execute}}

Para habilitar un addon, por ejemplo `heapster`:

`minikube addons enable heapster`{{execute}}

Resultado:
`heapster was successfully enabled`

Comprobar el Pod y el Service recién creados:

`kubectl get pod,svc -n kube-system`{{execute}}

Para deshabilitar `heapster`:

`minikube addons disable heapster`{{execute}}

Resultado:
`heapster was successfully disabled`