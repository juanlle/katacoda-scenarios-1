Para aumentar el escalado:

```
kubectl scale sts web --replicas=5
```{{execute}}

y comprobamos como escala secuencialmente:

```
watch kubectl get pods
```{{execute}}
