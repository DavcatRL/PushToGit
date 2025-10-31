#!/bin/bash

# === Controllo degli argomenti ===
# "$#" è una variabile speciale di Bash che contiene il numero di argomenti passati allo script.
# -lt 4 → significa “minore di 4”.
if [ "$#" -lt 4 ]; then
    echo "Uso: $0 <GitHub_username> <repo_name> \"<commit_message>\" <cartelle_da_pushare...>"
    exit 1
fi
# se ho meno di 4 argomenti, esco senz fare nulla

# === Parametri ===
USERNAME="$1"          # Es. DavcatRL
REPO_NAME="$2"         # Es. HomeworkRL2
COMMIT_MSG="$3"        # Es. "Homework 2 - Added packages"
shift 3                # Rimuove i primi 3 argomenti per lasciare solo i nomi delle cartelle
FOLDERS_TO_ADD="$@"    # Tutte le cartelle da pushare

# === Variabili derivate ===
REPO_URL="https://github.com/${USERNAME}/${REPO_NAME}.git"

# === Operazioni ===
echo "Pulizia repository locale..."
rm -rf .git
rm -f README.md

echo "Inizializzazione nuova repo..."
git init

echo "Aggiunta cartelle: $FOLDERS_TO_ADD"
git add $FOLDERS_TO_ADD

echo "Commit: \"$COMMIT_MSG\""
git commit -m "$COMMIT_MSG"

echo "Imposto il branch principale su 'main'..."
git branch -M main

echo "Collego la repo remota: $REPO_URL"
git remote add origin "$REPO_URL"

echo "Faccio pull (solo se la repo GitHub ha già file come README)..."
git pull origin main --rebase 2>/dev/null || echo "(Nessun file remoto, procedo)"

echo "Faccio push su GitHub..."
git push -u origin main

echo "Operazione completata con successo!"

