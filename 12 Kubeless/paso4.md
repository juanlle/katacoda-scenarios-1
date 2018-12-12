La interfaz de red del contenedor (_Container Network Interface_, CNI) define cómo deben comunicarse los diferentes nodos y sus cargas de trabajo. Hay varios proveedores de red disponibles, algunos se enumeran aquí.

### Tarea

En este escenario usaremos WeaveWorks. La definición de la implementación se puede ver con `cat ~/weave-kube.yaml`{{execute HOST1}}

Esto se puede implementar utilizando `kubectl apply`.

`kubectl apply -f ~/weave-kube.yaml`{{execute HOST1}}

Weave ahora se desplegará como una serie de Pods en el cluster. Su estado puede verse usando el comando `kubectl get pod -n kube-system`{{execute HOST1}}

Al instalar Weave en su clúster, visite https://www.weave.works/docs/net/latest/kube-addon/ para obtener más información.