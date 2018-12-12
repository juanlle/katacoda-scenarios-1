Una vez tenemos las reglas _ingress_ aplicadas, el tráfico se enrutará al lugar definido.

La primera solicitud será procesada por el despliegue de webapp1.

```
curl -H "Host: my.kubernetes.example" 172.17.0.105/webapp1
```
La segunda solicitud será procesada por el despliegue de webapp2.
```
curl -H "Host: my.kubernetes.example" 172.17.0.105/webapp2
```
Finalmente, todas las demás solicitudes serán procesadas por el despliegue de webapp3.
```
curl -H "Host: my.kubernetes.example" 172.17.0.105
```