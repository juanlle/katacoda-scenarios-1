Los volumenes creados con `emptyDir: {}` se crean en el propio sistema de archivos del nodo y solo viven mientras vive el pod (pero sobrevive a los reinicios). Probemos a desplegar un pod con un volumen de este tipo: 

```
kubectl create -f pod1.yaml
```{{execute}}

y comprobamos como los dos contenedores del pod comparten el mismo volumen, entrando en el contenedor `c1`

```
kubectl exec -it sharevol -c c1 bash
```{{execute}}

una vez dentro, comprobamos que el directorio `/tmp/xchange` esta vacío y creamos un archivo

```
ls /tmp/xchange
touch /tmp/xchange/iwashere.txt
ls /tmp/xchange
exit
```{{execute}}

y comprobamos en el contenedor `c2`:

```
kubectl exec -it sharevol -c c2 -- ls /tmp/data
```{{execute}}

limpiamos

```
kubectl delete pod sharevol
```{{execute}}
