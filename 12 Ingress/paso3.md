Las reglas _Ingress_ son un tipo de objeto de Kubernetes. Las reglas pueden basarse en el host de la solicitud (dominio), la ruta de la solicitud o una combinación de ambas.

Un conjunto de reglas de ejemplo están definidas en `cat ingress-rules.yaml`{{execute}}

Las partes importantes de las reglas se definen a continuación.

Las reglas se aplican a las solicitudes para el host _my.kubernetes.example_. Dos reglas se definen en función de la ruta de la solicitud con una sola captura de todas las definiciones. Las solicitudes a la ruta _/webapp1_ se reenvían al servicio _webapp1-svc_. Del mismo modo, las solicitudes a _/webapp2_ se reenvían a _webapp2-svc_. Si no se cumple ninguna de las reglas anteriores, se utilizará _webapp3-svc_.

A continuación podemos apreciar cómo la estructura de las URL de una aplicación puede comportarse de manera independiente a cómo se despliegan las aplicaciones.

```yaml
- host: my.kubernetes.example
  http:
    paths:
    - path: /webapp1
      backend:
        serviceName: webapp1-svc
        servicePort: 80
    - path: /webapp2
      backend:
        serviceName: webapp2-svc
        servicePort: 80
    - backend:
        serviceName: webapp3-svc
        servicePort: 80

```

### Tarea

Como el resto de objetos en Kubernetes, pueden desplegarse via `kubectl create -f ingress-rules.yaml`{{execute}}

Una vez desplegadas, el estado de las reglas _Ingress_ pueden comprobarse con `kubectl get ing`{{execute}}