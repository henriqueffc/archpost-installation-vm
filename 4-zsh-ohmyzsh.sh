#!/bin/bash

#Cores dos avisos

AZUL='\e[1;34m'
VERDE='\e[1;32m'
RED='\e[1;31m'
LVERDE='\e[0;92m'
FIM='\e[0m'

if ls -lha ~ | grep -oq .zshrc;
then
	echo "${AZUL}Arquivo .zshrc encontrado${FIM}"
	echo "${AZUL}Instalando Oh my Zsh, plugins e Powerlevel10K${FIM}"
	echo "${AZUL}Começando em 3...${FIM}" && sleep 1
	echo "${AZUL}Começando em 2...${FIM}" && sleep 1
	echo "${AZUL}Começando em 1...${FIM}" && sleep 1
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
	sed -i 's/plugins=(git)/\plugins=(git zsh-autosuggestions zsh-syntax-highlighting colored-man-pages history-substring-search)/' ~/.zshrc
	sed -i 's|robbyrussell|powerlevel10k/powerlevel10k|' ~/.zshrc
	linenumber=$(grep -nr "source" ~/.zshrc | gawk '{print $1}' FS=":")
	linenumber=$((linenumber-1))
	sed -i "${linenumber}i fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src" ~/.zshrc
	echo 'source ~/.bash_aliases' >> ~/.zshrc
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	echo "${AZUL}Instalação concluida. Reinicie o terminal para configurar o Powerlevel10K.${FIM}"
else
	echo "${AZUL}Arquivo .zshrc não encontrado na pasta home. Leia as intruções de instalação. Fim${FIM}"
fi 


