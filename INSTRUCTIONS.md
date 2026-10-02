# Instrucciones Adicionales

Este archivo reemplaza al clásico `HELP.md` o guías rápidas de Spring Boot.

## Pasos para Levantar la Base de Datos con Docker

Si tienes Docker instalado, no necesitas instalar PostgreSQL en tu máquina. Usa el archivo `docker-compose.yml` que viene en este repositorio:

```bash
docker-compose up -d
```

Esto iniciará una instancia de PostgreSQL en segundo plano.

## Comandos Útiles de Maven

- **Limpiar proyecto:** `mvn clean`
- **Compilar código:** `mvn compile`
- **Ejecutar tests:** `mvn test`
- **Empaquetar aplicación:** `mvn package`
- **Correr en desarrollo (Desde la raíz):** `mvn spring-boot:run -pl infrastructure`

Asegúrate siempre de haber configurado tu archivo `.env` antes de iniciar la aplicación.

## 🚀 Guía de Configuración del Servidor (Spring Boot)

Dado que este proyecto está estructurado con múltiples módulos (Arquitectura Limpia), sigue estos pasos para configurar y levantar el servidor backend correctamente:

### 1. Variables de Entorno
Antes de ejecutar el servidor, asegúrate de que el archivo `.env` en la raíz del proyecto tiene los valores correctos (especialmente las credenciales de la base de datos). El servidor Spring Boot lee estas variables automáticamente a través del archivo `application.yml`.

### 2. Sincronizar Base de Datos (Flyway)
No necesitas ejecutar scripts SQL manualmente. Al arrancar el servidor, **Flyway** se conectará automáticamente a la base de datos (puerto `5434` según el contenedor local) y ejecutará los 53 archivos de migración en orden estricto para crear todas las tablas.

### 3. Levantar el Servidor
Dado que es un proyecto multi-módulo, el punto de entrada principal está en la capa de `infrastructure`. 

**Desde la terminal:**
Sitúate en la raíz del proyecto (`back-intro`) y ejecuta:
```bash
mvn clean install -DskipTests
mvn spring-boot:run -pl infrastructure
```

**Desde Visual Studio Code:**
1. Ve a la pestaña **Run and Debug** (o presiona `Ctrl+Shift+D`).
2. Si tienes la extensión *Spring Boot Extension Pack* instalada, dirígete al panel "Spring Boot Dashboard".
3. Localiza `infrastructure` -> `BackIntroApplication` y dale al botón de Play (Start).

### 4. Verificar que funciona
Verás en la consola los logs de Spring Boot iniciando y a Flyway validando las migraciones. Una vez que veas la frase `Started BackIntroApplication in X seconds`, tu servidor estará listo para recibir peticiones (por defecto en `http://localhost:8080`).
