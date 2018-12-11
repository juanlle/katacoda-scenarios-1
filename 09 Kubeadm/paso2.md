Una vez que el Maestro se ha inicializado, los nodos adicionales pueden unirse al clúster siempre que tengan el token correcto. Los tokens se pueden administrar mediante el token de kubeadm, por ejemplo, la lista de tokens de kubeadm.

### Tarea

En el segundo nodo, ejecute el comando para unirse al clúster que proporciona la dirección IP del nodo maestro.

`kubeadm join --discovery-token-unsafe-skip-ca-verificación --token = 102952.1a7dd4cc8d1f4cc5 172.17.0.62:6443`{execute HOST2}

Este es el mismo comando que se muestra por terminal justo después de que se haya inicializado el Maestro.

La etiqueta `--discovery-token-unsafe-skip-ca-check` se utiliza para omitir la verificación de _Discovery Token_. Dado que este token se genera dinámicamente, no podríamos incluirlo en los pasos. Cuando esté en producción, use el token proporcionado por kubeadm init.