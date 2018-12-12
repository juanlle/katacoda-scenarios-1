Existen _runtimes_ adicionales. Además de Python 2.7 y 3.4, podemos desplegar funciones en Ruby, Node y .Net core.

Pasemos a desplegar una función en Node.js.

`cat hello.js`{{execute}}

Ejecutamos y desplegamos con:

`kubeless function deploy hello --runtime nodejs6 \
                              --handler hello.handler \
                              --from-file hello.js`{{execute}}

Y listamos las funciones

`kubeless function ls`{{execute}}

Y hacemos una llamada a la nueva función:

`kubeless function call hello --data '{"kubeless":"rocks"}'`{{execute}}

