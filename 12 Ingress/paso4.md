Una vez tenemos las reglas _ingress_ aplicadas, el tráfico se enrutará al lugar definido.

La primera solicitud será procesada por el despliegue de webapp1.

```
curl -H "Host: my.kubernetes.example" [[HOST_IP]]/webapp1
```{{execute}}
La segunda solicitud será procesada por el despliegue de webapp2.
```
curl -H "Host: my.kubernetes.example" [[HOST_IP]]/webapp2
```{{execute}}
Finalmente, todas las demás solicitudes serán procesadas por el despliegue de webapp3.
```
curl -H "Host: my.kubernetes.example" [[HOST_IP]]
```{{execute}}