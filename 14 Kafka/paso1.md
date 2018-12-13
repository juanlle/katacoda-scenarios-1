Para la instalación de Kafka usaremos el _chart_ oficial de Helm _bitnami/kafka_.

### Tarea

Desplegamos Kafka con un único comando:

```
helm install bitnami/kafka --name orange-kafka
```{{execute}}

Podemos ver el estado con `kubectl get pods`{{execute}}