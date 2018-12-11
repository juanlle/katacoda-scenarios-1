Ahora ya tenemos el clúster inicializado. El nodo _Master_ administrará el clúster, mientras que nuestro nodo _Worker_ ejecutará las cargas de trabajo de nuestros contenedores.

### Tarea

La CLI de Kubernetes, conocida como kubectl, ya puede usar la configuración para acceder al clúster. Por ejemplo, el siguiente comando devolverá los dos nodos de nuestro clúster.

`kubectl get nodes`{{execute HOST1}}

**En este punto, los nodos aun no estarán listos.**

Esto se debe a que la Interfaz de red del contenedor no se ha implementado. Esto se solucionará en el siguiente paso.