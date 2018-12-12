Use el comando _install_ para desplegar el chart en su clúster.

`helm install stable/redis`{{execute}}

A continuación, Helm desplegará los pods requeridos. Puedes ver todos los paquetes usando `helm ls` {{execute}}

Si Helm devuelve el error _'could not find a ready tiller pod'_, significa que Helm aún se está implementando. Espere unos momentos a que finalice la descarga de la image de docker de _Tiller_.

En el siguiente paso comprobaremos el estado del despliegue.
