Los volumenes creados con `hostPath` se crean en el propio sistema de archivos del nodo y son persistentes. Probemos a desplegar un pod con un volumen de este tipo: 

```
kubectl create -f pod2.yaml
```{{execute}}

Si comprobamos el estado veremos que falla a causa de no encontrar un directorio en el host

```
kubectl describe pod test-pd
```{{execute}}

Pero si creamos el directorio

```
mkdir /root/data
```{{execute}}

y volvemos a comprobar pasados unos segundos, veremos que ya ha conseguido montar el volumen

```
kubectl describe pod test-pd
```{{execute}}

Para comprobar la persistencia, accedemos al pod y creamos un archivo

```
kubectl exec -it test-pd -- touch /test-pd/iwashere.txt
```{{execute}}

y comprobamos en el host:

```
ls /root/data
```{{execute}}

ahora borramos el pod

```
kubectl delete pod test-pd
```{{execute}}

y comprobamos de nuevo en el host:

```
ls /root/data
```{{execute}}
