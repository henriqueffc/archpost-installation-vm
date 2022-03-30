# archpost-installation-vm

Configuração para **máquina virtual**.

Eu uso os scripts desse repositório após instalar o Arch Linux usando o script de instalação *archinstall* fornecido pela ISO oficial do Arch em uma máquina virtual.

Os scripts foram concebidos especificamente para a configuração de uma **máquina virtual** conforme o meu uso. 

Ordem de uso dos scripts:

    initialconfig.sh
    1-pacotes.sh
    2-flatpakefonte.sh
    3-yay.sh
    4-grid.sh
    5-zsh-ohmyzsh.sh

O script initialconfig.sh deve ser executado como chroot após o termino da execução do archinstall. No final da instalação é sugerido pelo script archinstall que se continue como chroot para que o usuário execute outras configurações desejadas para o sistema.

Os scripts restantes deverão ser executados após o reboot da máquina virtual e com o sistema iniciado no ambiente gráfico. É preciso clonar novamente o reposítório. Sugiro que seja clonado na pasta home do usuário.
