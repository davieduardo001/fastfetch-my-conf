#!/bin/bash

CONFIG_DIR="$HOME/.config/fastfetch"

HOME_DIR="$HOME/configs/fasfetch"
HOME_FILE="$HOME/configs/fastfetch/minimal.jsonc"

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
    exit 1
  fi
fi

echo "Criando diretório de configuração, se não existir..."
mkdir -p "$CONFIG_DIR"

echo "Copiando arquivo de configuração para $CONFIG_DIR ..."
cp "./$HOME_FILE" "$CONFIG_DIR"

echo "Configuração aplicada! Você pode executar:"
echo "  fastfetch --load-config fastfetch.config"
