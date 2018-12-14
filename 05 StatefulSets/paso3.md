Para disminuir el escalado:

```
kubectl scale sts web --replicas=2
```{{execute}}

y comprobamos como escala secuencialmente:

```
watch kubectl get pods
```{{execute}}
