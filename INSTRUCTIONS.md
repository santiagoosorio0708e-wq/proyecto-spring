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
- **Correr en desarrollo:** `mvn spring-boot:run`

Asegúrate siempre de haber configurado tu archivo `.env` a partir de `.env.template` antes de iniciar la aplicación.
