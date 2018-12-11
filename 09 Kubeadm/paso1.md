Kubeadm viene ya instalado en los nodos. Los paquetes de instalación están disponibles para Ubuntu 16.04+, CentOS 7 o HypriotOS v1.0.1 +.

La primera etapa de inicialización del clúster es iniciar el nodo maestro. El master es responsable de ejecutar los componentes del plano de control, etcd y el servidor API. Los clientes se comunicarán con la API para programar las cargas de trabajo y administrar el estado del clúster.

### Tarea

El siguiente comando inicializará el clúster con un token conocido para simplificar los siguientes pasos.

`kubeadm init --token=102952.1a7dd4cc8d1f4cc5 --kubernetes-version $(kubeadm version -o short)`{{execute HOST1}}

En producción, se recomienda excluir el token, ya que Kubeadm generará uno de forma automática.

Para administrar el clúster Kubernetes, se requieren la configuración del cliente y los certificados. Esta configuración se crea cuando kubeadm inicializa el clúster. El comando copia la configuración en el directorio de inicio del usuario y establece la variable de entorno para su uso con el CLI.

`sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
export KUBECONFIG=$HOME/admin.conf`{{execute HOST1}}