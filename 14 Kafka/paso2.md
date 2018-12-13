Una vez tenemos lanzado Kafka lo primero es crear un _topic_.

### Tarea

Vamos a crear el topic 'test'
```
kubectl exec -it orange-kafka-kafka-0 -- kafka-topics.sh --create --zookeeper orange-kafka-zookeeper:2181 --replication-factor 1 --partitions 1 --topic test
```{{execute}}

y comprobamos que se ha creado, listando todos los topics:

```
kubectl exec -it orange-kafka-kafka-0 -- kafka-topics.sh --list --zookeeper orange-kafka-zookeeper:2181
```{{execute}}
