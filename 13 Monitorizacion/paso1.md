Para la instalación de Prometheus usaremos el _chart_ oficial de Helm _prometheus-operator_. Este chart dispone de multitud de opciones, por lo que podemos echar un vistazo al archivo de configuración por defecto. Entre otros servicios, este chart instala Grafana y exportadores listos para monitorizar nuestro clúster.

`cat default.conf`{{execute}}

Debemos habilitar el almacenamiento persistente para todos los componentes de Prometheus y también tenemos que exponer Grafana con un _Ingress_. Este es le contenido del archivo de valores personalizados que pasaremos a Helm durante la instalación:

<pre class="file">
# Dependiendo de la solución DNS que hayamos instalado en nuestro clúster habilitaremos el exportador correspondiente
coreDns:
  enabled: false
kubeDns:
  enabled: true

alertmanager:
  alertmanagerSpec:
    storage:
      volumeClaimTemplate:
        spec:
          accessModes: ["ReadWriteOnce"]
          resources:
            requests:
              storage: 10Gi

prometheus:
  prometheusSpec:
    storage:
      volumeClaimTemplate:
        spec:
          accessModes: ["ReadWriteOnce"]
          resources:
            requests:
              storage: 10Gi

grafana:
  adminPassword: "AllYouNeedIsLove"
  ingress:
    enabled: true
    annotations:
      kubernetes.io/ingress.class: nginx
      kubernetes.io/tls-acme: "true"
    hosts:
      - grafana.test.akomljen.com
    tls:
      - secretName: grafana-tls
        hosts:
          - grafana.test.akomljen.com
  persistence:
    enabled: true
    accessModes: ["ReadWriteOnce"]
    size: 10Gi

</pre>

En este ejercicio usaremos la configuración por defecto.

### Tarea

Desplegamos el _prometheus-operator_ con todas sus dependencias con un único comando:

```
helm install stable/prometheus-operator --name prometheus-operator --namespace monitoring -f custom-values.yaml
```{{execute}}

Podemos ver el estado con `kubectl --namespace monitoring get pods -l "release=prometheus-operator"`{{execute}}