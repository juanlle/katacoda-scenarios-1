Podemos ver los logs de la función

`kubeless function logs toy`{{execute}}

Así como su descripción

`kubeless function describe toy`{{execute}}

Para actualizar una función usaremos el comando `kubeless function update`. Por ejemplo, para reemplazar la función toy por el método del script `toy-udpate.py`, haremos:

`kubeless function update toy --from-file toy-update.py`{{execute}}

Si comprobamos el contenido de la nueva función veremos que 'hardcodea' el objeto JSON que es devuelto:

`cat toy-update.py`{{execute}}

Internamente, Kubernetes realizará un rolling update de los Pods con nuestra función. Una vez finalizado, podemos llamar a nuestra función y comprobar que nuestra nueva función se ha desplegado.

`kubeless function call toy --data '{"hello":"world"}'`{{execute}}
