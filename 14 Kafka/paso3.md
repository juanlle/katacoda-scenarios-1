Una vez tenemos un _topic_ necesitamos un _producer_ que emita los mensajes.

### Tarea

Vamos a iniciar el producer de Kafka:
```
kubectl exec -it orange-kafka-kafka-0 -- kafka-console-producer.sh --broker-list localhost:9092 --topic test
```{{execute}}

y probemos a lanzar un mensaje:
```
All you need is Love!
```{{execute}}