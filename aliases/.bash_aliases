alias neo="neofetch --colors 4 3 5 7 1 2"
alias atualizar="flatpak update && flatpak remove --unused && yay -Syu"
alias limpar="sudo paccache -rk1 && yay -Yc"
alias dados="yay -Ps"
alias reflector="sudo reflector -l 10 -c Brazil -a 12 -p https -p http --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syy"
alias xls="exa -a --icons --color=always --group-directories-first"
alias xll="exa -lag --icons --color=always --group-directories-first --octal-permissions"
alias bat="bat --theme=Dracula"
alias omz="git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull && omz update"
alias erro="sudo sudo dmesg -l err && systemctl --failed && journalctl -p 3 -xb"
