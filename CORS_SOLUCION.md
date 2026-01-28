# Solución al Error de CORS

## Problema
El navegador está bloqueando las peticiones HTTP desde `http://localhost:51101` (Flutter web) hacia `http://127.0.0.1:5000` (servidor backend) debido a la política CORS (Cross-Origin Resource Sharing).

## Soluciones

### Solución 1: Configurar CORS en el Servidor Backend (RECOMENDADO)

Si tu servidor backend está en **Python Flask**, agrega lo siguiente:

```python
from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Permite todas las solicitudes CORS

# O para configurar específicamente:
# CORS(app, resources={r"/personas": {"origins": "*"}})

@app.route('/personas')
def get_personas():
    # Tu código aquí
    pass
```

**Instalar flask-cors:**
```bash
pip install flask-cors
```

Si tu servidor está en **Node.js/Express**, agrega:

```javascript
const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors()); // Permite todas las solicitudes CORS

// O para configurar específicamente:
// app.use(cors({
//   origin: 'http://localhost:51101'
// }));

app.get('/personas', (req, res) => {
  // Tu código aquí
});
```

**Instalar cors:**
```bash
npm install cors
```

### Solución 2: Usar localhost en lugar de 127.0.0.1

Ya se ha modificado el código para usar `localhost` cuando está en web. Esto puede ayudar en algunos casos, pero **aún necesitas configurar CORS en el servidor**.

### Solución 3: Ejecutar Flutter con un Proxy (Solo Desarrollo)

Puedes ejecutar Flutter web con un proxy que redirija las peticiones:

```bash
flutter run -d chrome --web-port=8080
```

Y luego configurar un proxy manualmente o usar herramientas como `http-proxy-middleware`.

## Verificación

Después de configurar CORS en tu servidor backend:

1. Reinicia tu servidor backend
2. Recarga la aplicación Flutter web
3. Verifica en la consola del navegador que no aparezcan errores de CORS

## Nota Importante

- La solución de código en Flutter (usar `localhost` en web) es solo una ayuda parcial
- **La solución definitiva es configurar CORS en el servidor backend**
- En producción, configura CORS para permitir solo los orígenes específicos que necesites, no uses `*` (asterisco)

