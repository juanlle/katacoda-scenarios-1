Ahora necesitamos un _consumer_ que reciba los mensajes emitidos por el _producer_.

### Tarea

Antes vamos a abrir un nuevo terminal, pulsando en el boton + y seleccionamos la opción 'Open New Terminal'. En esta nueva pestaña es donde vamos a iniciar el consumer de Kafka con el comando:
```
kubectl exec -it orange-kafka-kafka-0 -- kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
```{{execute}}

y veremos como se recibe el mensaje que habíamos enviado.

Si lo deseamos podemos volver al terminal del producer e ir escribiendo mensajes, que si cambiamos al terminal del consumer los podremos ver llegar.

Probemos en el terminal del producer:
```
la la la la la, love is all you need
```{{execute}}

y pasemos al terminal del consumer de nuevo.