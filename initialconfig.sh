#!/bin/bash

# Locale.gen
sed -i 's/#pt_BR.UTF-8 UTF-8/\pt_BR.UTF-8 UTF-8/' /etc/locale.gen
locale-gen

# Vconsole.conf (Já foi configurado pelo Archinstall)
# echo "KEYMAP=br-abnt2" > /etc/vconsole.conf

# Idioma e hostname
echo 'LANG=pt_BR.UTF-8' > /etc/locale.conf
#echo "nome_do_Host" > /etc/hostname (já foi feito pelo Archinstall.)


# Visudo
sed -i '82s/..//' /etc/sudoers
echo '# Defaults specification' >> /etc/sudoers
echo 'Defaults editor=/usr/bin/nano' >> /etc/sudoers

# Caso queira o vim ao invés do nano, comente (#) a linha acima e descomente a linha abaixo.
# echo "Defaults editor=/usr/bin/vim" >> /etc/sudoers

# Pacman.conf
cp /etc/pacman.conf /etc/pacman.conf.bak
sed -i '32s/#//' /etc/pacman.conf
sed -i 's/#Color/\Color/' /etc/pacman.conf
sed -i 's/#VerbosePkgLists/\VerbosePkgLists/' /etc/pacman.conf
sed -i 's/#ParallelDownloads = 5/\ParallelDownloads = 5/' /etc/pacman.conf
sed -i 's/#CheckSpace/\CheckSpace/' /etc/pacman.conf
sed -i '93s/#//' /etc/pacman.conf
sed -i '94s/#//' /etc/pacman.conf
#sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf (outra forma para habilitar o multilib)

# NANO
sed -i 's/# set linenumbers/\set linenumbers/' /etc/nanorc
sed -i '243s/..//' /etc/nanorc

# Swappiness
mv 99-swappiness.conf /etc/sysctl.d/

printf "\e[1;32mFim! Escreva exit, pressione enter e reinicie com o comando reboot.\e[0m"
