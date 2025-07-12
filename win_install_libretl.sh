#!/bin/bash

echo "Asennetaan LibreTranslate..."

# Tarkista, onko Python 3 asennettu
if ! command -v python3 &>/dev/null; then
    echo "Python 3 ei ole asennettu. Asennetaan Python 3..."
    sudo apt update
    sudo apt install -y python3 python3-pip python3-venv
fi

# Luo virtuaaliympäristö (venv), jos sitä ei ole
if [ ! -d "venv" ]; then
    echo "Luodaan Python virtuaaliympäristö..."
    python3 -m venv venv
fi

# Aktivoidaan virtuaaliympäristö ja asennetaan LibreTranslate
echo "Aktivoidaan virtuaaliympäristö ja asennetaan LibreTranslate..."
.\venv\Scripts\activate
pip install --upgrade pip
pip install libretranslate

echo "LibreTranslate asennus valmis." 