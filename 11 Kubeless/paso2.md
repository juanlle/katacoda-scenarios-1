Para implementar una función, utilizaremos el CLI `kubeless`. Deberemos especificar un _runtime_ que establecerá en qué idioma está nuestra función. Deberemos también especificar el archivo que contiene la función, cómo se activará la función (aquí usamos un disparador de HTTP) y finalmente deberemos especificar el nombre de la función como un _handler_ .

`kubeless function deploy toy --runtime python2.7 \
                              --handler toy.handler \
                              --from-file toy.py`{{execute}}

Ahora ya podemos listar las funciones desplegadas con el CLI `kubeless`:

`kubeless function ls`{{execute}}

Mientras la función es desplegada podemos echar un vistazo a la propia función Python:

`cat toy.py`{{execute}}

Internamente y de forma automática, Kubeless crea un deployment y un service de Kubernetes. Ya podemos comprobar si existe un Pod que contenga nuestra función esta ejecutándose:

`kubectl get pods`{{execute}}
