# archpost-installation-vm

Configuração para **máquina virtual**.

Eu uso os scripts desse repositório após instalar o Arch Linux usando o script de instalação *archinstall* fornecido pela [ISO](https://archlinux.org/download/) oficial em uma máquina virtual.

Os scripts foram concebidos especificamente para a configuração de uma **máquina virtual** conforme o meu uso para testes do sistema. 

**Eu instalo o sistema em UEFI, com systemd-boot, pipewire e com GNOME. As configurações dos scripts são concebidas nessa base.**

Ordem de uso dos scripts:

- initialconfig.sh
- 1-pacotes.sh
- 2-flatpakefonte.sh
- 3-yay.sh
- 4-grid.sh
- 5-zsh-ohmyzsh.sh

O script *initialconfig.sh* deve ser executado ainda como chroot após o termino da execução do *archinstall*. No final da instalação é sugerido pelo script *archinstall* que se continue como chroot para que o usuário execute outras configurações desejadas para o sistema.

Os scripts restantes deverão ser executados após o reboot da máquina virtual e com o sistema iniciado no ambiente gráfico. 

É preciso clonar novamente o repositório, pois a pasta criada durante o chroot foi clonada na pasta raiz do sistema. Sugiro que a nova clonagem do repositório seja feita na pasta home do usuário. A pasta criada anteriormente na raiz do sistema será removida automaticamente pelo script 1-pacotes.sh.
