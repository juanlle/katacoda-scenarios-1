Para la instalación de Kafka usaremos el _chart_ oficial de Helm _bitnami/kafka_.

### Tarea

Primero debemos iniciar Helm y añadir el repositorio de charts de bitnami con:
```
helm init && helm repo add bitnami https://charts.bitnami.com && helm repo update 
```{{execute}}

y ya podemos desplegar Kafka con un único comando:

```
helm install bitnami/kafka --name orange-kafka --set service.type=LoadBalancer,persistence.enabled=false
```{{execute}}

Podemos ver el estado con `kubectl get pods`{{execute}}