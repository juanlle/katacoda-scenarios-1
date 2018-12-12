Podemos llamar a la función utilizando el _convenience wrapper_ del CLI de kubeless:

`kubeless function call toy --data '{"hello":"world"}'`{{execute}}

O podemos llamar al _endpoint_ del servicio si tenemos un proxy ejecutándose.

Vamos a lanzar un proxy:

`kubectl proxy --port 8080 &`{{execute}}

Y ahora llamamos a la función directamente con el comando _curl_:

`curl --data '{"hello":"world"}' localhost:8080/api/v1/namespaces/default/services/toy:8080/proxy/ --header "Content-Type:application/json"`{{execute}}
