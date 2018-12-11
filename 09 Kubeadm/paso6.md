Como hemos visto anteriormente, Kubernetes tiene una interfaz de usuario web o `Dashboard` lo que nos da visibilidad al clúster de Kubernetes.

### Tarea

Desplegar el yaml del dashboard con el comando `kubectl apply -f dashboard2.yaml`{{execute HOST1}}

El panel de control se despliega en el espacio de nombres o _namespace_ `kube-system`. Para ver el estado del despliegue `kubectl get pods -n kube-system`{{execute HOST1}}

Se requiere un _ServiceAccount_ para iniciar sesión. Se utiliza un _ClusterRoleBinding_ para asignar al nuevo _ServiceAccount_ (admin-user) el rol de cluster-admin en el clúster.

```
cat <<EOF | kubectl create -f - 
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1beta1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kube-system
EOF
```{{execute HOST1}}

Esto significa que pueden controlar todos los aspectos de Kubernetes. Con _ClusterRoleBinding_ y _RBAC_, se pueden definir diferentes niveles de permisos según los requisitos de seguridad. Puede encontrar más información sobre cómo crear un usuario para el _Dashboard_ en la [documentación del Dashboard](https://github.com/kubernetes/dashboard/wiki/Creating-sample-user).

Una vez que se ha creado la Cuenta de servicio (_ServiceAccount_), para obtener el token para iniciar sesión ejecutar:

`kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')`{{execute HOST1}}

AL desplegar el _Dashboard_, se usaron IPs externas para vincular el servicio con el puerto 30000. Esto hace que el panel de control esté disponible fuera del clúster y se pueda ver en https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/

Utilice el token de _admin-user_ para acceder al panel de control.

Para entornos productivos, en lugar de las IP externas, se recomienda usar `kubectl proxy` para acceder al panel de control. Ver más detalles en https://github.com/kubernetes/dashboard.