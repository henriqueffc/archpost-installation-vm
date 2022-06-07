# <img align="left" alt="Arch Linux" width="42px" src="https://cdn.jsdelivr.net/npm/simple-icons@6.23.0/icons/archlinux.svg" /> archpost-installation-vm

[<img align="left" alt="License MIT" src="https://img.shields.io/github/license/henriqueffc/archpost-installation-vm?style=flat-square" />](https://github.com/henriqueffc/archpost-installation-vm/blob/main/LICENSE)
<img align="left" alt="Last commit" src="https://img.shields.io/github/last-commit/henriqueffc/archpost-installation-vm?style=flat-square" /> <br>

Configuração para **máquina virtual**.

Eu uso os scripts desse repositório **somente após** instalar o Arch Linux usando o script de instalação [*archinstall*](https://github.com/archlinux/archinstall) fornecido pela [ISO](https://archlinux.org/download/) oficial em uma máquina virtual.

**Último teste dos scripts: 07 de abril 2022**

Os scripts foram concebidos especificamente para a configuração de uma **máquina virtual** conforme o meu uso para testes do sistema.

**Eu instalo o sistema em UEFI, com systemd-boot, pipewire, wireplumber, ZRAM e GNOME 42. As configurações dos scripts são concebidas nessa base.**

Os scripts deverão ser executados após a inicialização do sistema virtualizado no ambiente gráfico.

Caso o git não esteja instalado no sistema, execute:

`sudo pacman -S git --needed`

Para usar os scripts clone o repositório e acesse a pasta:

`git clone http://github.com/henriqueffc/archpost-installation-vm`
`cd archpost-installation-vm`

É necessário dar permissão de execução para os arquivos .sh

`chmod +x *.sh`

Ordem de uso dos scripts:

- initialconfig.sh (esse script deve ser executado com o comando sudo - `sudo ./initialconfig.sh`)
- 1-videoeaudio.sh
- 2-pacotes.sh
- 3-flatpakefonte.sh
- 4-yay.sh
- 5-grid.sh
- 6-zsh-ohmyzsh.sh

Recomendo reinicializar o sistema após a execução de cada script.
