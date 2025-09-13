#!/bin/bash

CONFIG_DIR="$HOME/.config/fastfetch"

HOME_DIR="$HOME/configs/fastfetch-my-conf"
HOME_FILE="$HOME/configs/fastfetch-my-conf/minimal.jsonc"

# Verifica se o fastfetch está instalado
if command -v fastfetch >/dev/null 2>&1; then
  echo "fastfetch está instalado."
else
  echo "fastfetch NÃO está instalado. Instalando..."
  # Aqui você pode ajustar para sua distro, exemplo para Fedora/DNF
  if command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y fastfetch
  elif command -v apt >/dev/null 2>&1; then
    sudo apt update && sudo apt install -y fastfetch
  else
    echo "Por favor, instale o fastfetch manualmente."
    echo "Esta usando variante de ubuntu? [Y/n]"
read eh_ubuntu_debian

if [[ "$eh_ubuntu_debian" == "Y" || "$eh_ubuntu_debian" == "y" ]]; then
    echo "Baixando e instalando o pacote .deb..."
    wget -P "$HOME" https://github.com/fastfetch-cli/fastfetch/releases/download/2.52.0/fastfetch-linux-amd64.deb
    sudo dpkg -i "$HOME/fastfetch-linux-amd64.deb"

    # Corrige dependências caso a instalação falhe
    sudo apt-get install -f

    # Remove o arquivo .deb após a instalação
    rm "$HOME/fastfetch-linux-amd64.deb"
    
    echo "Instalação do fastfetch concluída."
else
    echo "Não foi possível instalar o fastfetch. O script suporta apenas variantes de Ubuntu e Debian."
fi
      
    exit 1
  fi
fi

echo "Criando diretório de configuração, se não existir..."
mkdir -p "$CONFIG_DIR"

echo "Copiando arquivo de configuração para $CONFIG_DIR ..."
cp "$HOME_FILE" "$CONFIG_DIR"

echo "Configuração aplicada! Você pode executar:"
echo "  fastfetch --load-config minimal"
