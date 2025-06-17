# Fastfetch Custom Config

Este repositório contém uma configuração personalizada do [Fastfetch](https://github.com/fastfetch-cli/fastfetch) e um script para facilitar a instalação e aplicação dessa configuração.

---

## Conteúdo

* `minimal.jsonc` — arquivo JSON com a configuração personalizada do Fastfetch.
* `apply.sh` — script para instalar o Fastfetch (se necessário) e copiar a configuração para o diretório correto.

---

## Como usar

1. Clone ou baixe este repositório.

2. Dê permissão de execução ao script:

```bash
chmod +x apply.sh
```

3. Execute o script para aplicar a configuração:

```bash
./apply.sh
```

O script irá:

* Verificar se o Fastfetch está instalado e instalar caso não esteja (suporta `dnf` e `apt`).
* Criar o diretório `~/.config/fastfetch` caso não exista.
* Copiar o arquivo `fastfetch.config.json` para o diretório de configuração.

4. Para rodar o Fastfetch com a configuração aplicada, use:

```bash
fastfetch --load-config minimal
```

---

## Personalização

Você pode editar o arquivo `fastfetch.config.json` para modificar a aparência e os módulos exibidos pelo Fastfetch.

---

## Requisitos

* Fastfetch versão 2.14.0 ou superior (o script instala a versão adequada automaticamente se você usar `dnf` ou `apt`).
* Bash para rodar o script.

---

## Licença

Este projeto é open source e pode ser modificado livremente.
