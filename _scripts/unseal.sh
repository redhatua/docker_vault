#!/usr/bin/env bash
## CONFIG LOCAL ENV
echo "[*] Config local environment..."
shopt -s expand_aliases
alias vault='docker-compose exec vault vault "$@"'
export VAULT_ADDR=http://127.0.0.1:8200

## UNSEAL VAULT
echo "[*] Unseal vault..."
vault operator unseal -address=${VAULT_ADDR} $(grep 'Unseal Key 1:' ./_data/keys.txt | cut -d ' ' -f4)
vault operator unseal -address=${VAULT_ADDR} $(grep 'Unseal Key 2:' ./_data/keys.txt | cut -d ' ' -f4)
vault operator unseal -address=${VAULT_ADDR} $(grep 'Unseal Key 3:' ./_data/keys.txt | cut -d ' ' -f4)
