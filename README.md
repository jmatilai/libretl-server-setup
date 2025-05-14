# libretl-server-setup

libretranslate-pohjainen palvelin asennus- ja ajoskripti sisäiseen käyttöön.

https://github.com/LibreTranslate/LibreTranslate

* `install_libretl.sh`: luo venv ja asenna libretranslate
* `start_libretl.sh`: käynnistä palveluna (service), määritä kielet ja portti
* `stop_libretl.sh`: pysäytä palvelu

## API-esimerkki

Pyyntö:

```python

import requests
import json

# Paikallisen LibreTranslate-palvelimen URL-osoite
url = "http://localhost:5000/translate"

# Pyynnön sisältö
payload = {
    "q": "Hello!",
    "source": "en",
    "target": "es",
}

# Aseta content type -otsake
headers = {
    "Content-Type": "application/json"
}

# Lähetä POST-pyyntö palvelimelle
response = requests.post(url, data=json.dumps(payload), headers=headers)

# Tulosta vastaus
print("Statuskoodi:", response.status_code)
print("Vastaus JSON:", response.json())
```

response.json sisältö:

```json
{
    "translatedText": "¡Hola!"
}
```

## Lisää Python-esimerkkejä

Katso `esimerkki.py`.