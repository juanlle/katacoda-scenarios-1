HOST_IP=$(echo $SSH_CONNECTION | awk '{print $3}')
sed -i "s/HOST_IP/${HOST_IP}/g" ~/ingress.yaml
clear
echo -e "\u001b[32mEsta es tu Consola Interactiva.\u001b[m\r\n"
launch.sh
