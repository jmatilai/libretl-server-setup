#!/bin/bash

echo "Käynnistetään LibreTranslate palvelu..."

# Tarkista, onko virtuaaliympäristö olemassa
if [ ! -d "venv" ]; then
    echo "Virtuaaliympäristöä ei löytynyt. Aja ensin install_libretl.sh."
    exit 1
fi

# Aktivoidaan virtuaaliympäristö
.\venv\Scripts\activate

# kielet
kielet="en,es,fi,de,sv,no"

# Käynnistetään LibreTranslate taustapalveluna
nohup libretranslate --load-only $kielet --port 5000 > libretl.log 2>&1 &

# Tallentaa PID:n palvelun loputtamiseksi myöhemmin
echo $! > libretl.pid

echo "LibreTranslate palvelu käynnistetty portissa 5000 (PID: $(cat libretl.pid))."
echo "Palvelu lataa kielet: $kielet"
echo "Lokitiedosto: libretl.log" 