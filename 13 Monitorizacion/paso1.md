Para la instalación de Prometheus usaremos el _chart_ oficial de Helm _prometheus-operator_. Este chart dispone de multitud de opciones, por lo que podemos echar un vistazo al archivo de configuración por defecto. Entre otros servicios, este chart instala Grafana y exportadores listos para monitorizar nuestro clúster.

`cat default.conf`{{execute}}

Debemos habilitar el acceso desde el exterior usando servicios del tipo _NodePort_. Este es le contenido del archivo de valores personalizados que pasaremos a Helm durante la instalación:

<pre class="file">
alertmanager:
  service:
    type: NodePort
    nodePort: 30091

prometheus:
  service:
    type: NodePort
    nodePort: 30090

grafana:
  service:
    type: NodePort
    nodePort: 30092

</pre>

### Tarea

Desplegamos el _prometheus-operator_ con todas sus dependencias con un único comando:

```
helm install stable/prometheus-operator --name prometheus-operator --namespace monitoring -f custom-values.yaml
```{{execute}}

Podemos ver el estado con `kubectl --namespace monitoring get pods -l "release=prometheus-operator"`{{execute}}