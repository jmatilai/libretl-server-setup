#!/bin/bash

echo "Pysäytetään LibreTranslate palvelu..."

# Tarkista, onko PID-tiedosto olemassa
if [ ! -f "libretl.pid" ]; then
    echo "PID-tiedostoa ei löytynyt. LibreTranslate palvelu ei ole käynnissä."
    exit 1
fi

# Lue PID ja pysäytä prosessi
PID=$(cat libretl.pid)
if ps -p $PID > /dev/null; then
    kill $PID
    echo "LibreTranslate palvelu (PID: $PID) pysäytetty."
else
    echo "Prosessi (PID: $PID) ei löytynyt."
fi

# Poista PID-tiedosto
rm libretl.pid

echo "LibreTranslate palvelu pysäytetty." 