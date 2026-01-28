# Script para ejecutar Flutter en Chrome con flags de desarrollo (permite CORS)
# ADVERTENCIA: Solo para desarrollo. No usar en producción.
flutter run -d chrome --web-browser-flag="--disable-web-security" --web-browser-flag="--user-data-dir=C:/temp/chrome_dev"

