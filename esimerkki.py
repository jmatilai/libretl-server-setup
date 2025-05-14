#!/usr/bin/env python3
import requests
import json

def translate_text(text, source_lang="en", target_lang="es"):
    """
    Translate text using local LibreTranslate server
    
    Args:
        text (str): Text to translate
        source_lang (str): Source language code (default: en)
        target_lang (str): Target language code (default: es)
        
    Returns:
        str: Translated text
    """
    url = "http://localhost:5000/translate"
    
    payload = {
        "q": text,
        "source": source_lang,
        "target": target_lang
    }
    
    headers = {
        "Content-Type": "application/json"
    }
    
    response = requests.post(url, data=json.dumps(payload), headers=headers)
    
    if response.status_code == 200:
        result = response.json()
        return result["translatedText"]
    else:
        return f"Error: {response.status_code} - {response.text}"

# Example usage
if __name__ == "__main__":
    # Example 1: English to Spanish
    text = "Hello!"
    translated = translate_text(text, "en", "es")
    print(f"'{text}' in Spanish: '{translated}'")
    
    # Example 2: English to Finnish
    text = "Welcome to LibreTranslate"
    translated = translate_text(text, "en", "fi")
    print(f"'{text}' in Finnish: '{translated}'")
    
    # Example 3: Spanish to English
    text = "¡Hola mundo!"
    translated = translate_text(text, "es", "en")
    print(f"'{text}' in English: '{translated}'") 