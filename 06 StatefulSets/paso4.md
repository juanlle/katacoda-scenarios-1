Ademas de la eliminación tradicional en cascada, también podemos eliminar el objeto principal manteniendo sus hijos. Probemos con el StatefulSet que hemos creado:

```
kubectl delete statefulset web --cascade=false
```{{execute}}

y comprobamos como no ha eliminado los pods:

```
watch kubectl get pods
```{{execute}}

eliminamos un solo pod y comprobamos de nuevo como se mantienen los demás y no se crean o reinician nuevos

```
kubectl delete pod web-0 & watch kubectl get pods
```{{execute}}

ya podemos eliminar los demás

```
kubectl delete pods -l app=nginx
```{{execute}}
