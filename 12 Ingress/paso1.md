Para comenzar, desplegaremos un servidor HTTP de ejemplo que será el destino de nuestras peticiones. El despliegue contiene tres _deployments_, uno llamado webapp1 y un segundo llamado webapp2, y un tercero llamado webapp3 con un servicio para cada uno.

`cat deployment.yaml`{{execute}}

### Tarea

Desplegamos las definiciones con `kubectl apply -f deployment.yaml`{{execute}}

Podemos ver el estado con `kubectl get deployment`{{execute}}