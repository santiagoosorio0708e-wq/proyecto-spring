<!-- ANCLA_INICIO -->
<a name="inicio"></a>

<div align="center">

# 🚀 Proyecto Spring Boot - Back Intro 🚀

[![Stars](https://img.shields.io/github/stars/santiagoosorio0708e-wq/proyecto-spring?style=for-the-badge&color=yellow)](https://github.com/santiagoosorio0708e-wq/proyecto-spring/stargazers)
[![Forks](https://img.shields.io/github/forks/santiagoosorio0708e-wq/proyecto-spring?style=for-the-badge&color=blue)](https://github.com/santiagoosorio0708e-wq/proyecto-spring/network/members)
[![Issues](https://img.shields.io/github/issues/santiagoosorio0708e-wq/proyecto-spring?style=for-the-badge&color=red)](https://github.com/santiagoosorio0708e-wq/proyecto-spring/issues)
[![Licencia](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=spring-boot&logoColor=white)](https://spring.io/projects/spring-boot)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)

Un sistema avanzado para la gestión clínica, de pacientes, notas médicas e integraciones de chat con IA, diseñado con una arquitectura robusta y escalable.

</div>

---

<details open>
  <summary><b>📚 Tabla de Contenidos interactiva</b></summary>
  <ol>
    <li><a href="#acerca-del-proyecto">Acerca del Proyecto</a></li>
    <li><a href="#construido-con">Construido con</a></li>
    <li><a href="#arquitectura-del-sistema">Arquitectura del Sistema</a></li>
    <li><a href="#prerrequisitos">Prerrequisitos</a></li>
    <li><a href="#instalación">Instalación</a></li>
    <li><a href="#uso-y-características">Uso y Características</a></li>
    <li><a href="#pruebas">Pruebas</a></li>
    <li><a href="#hoja-de-ruta">Hoja de Ruta (Roadmap)</a></li>
    <li><a href="#contacto">Contacto</a></li>
  </ol>
</details>

---

## 🌟 Acerca del Proyecto <a name="acerca-del-proyecto"></a>

Este proyecto sirve como núcleo para un sistema de **Información Clínica y Gestión de Encuentros Médicos**. Maneja historiales, chats con pacientes impulsados por modelos de inteligencia artificial, gestión de contactos y mucho más, soportando hasta 52 tablas transaccionales mediante migraciones Flyway.

[🔼 Volver al inicio](#inicio)

---

## 🛠️ Construido con <a name="construido-con"></a>

El backend ha sido construido priorizando el rendimiento, la mantenibilidad y la seguridad:

*   **Java 17+**
*   **Spring Boot 3.x**
*   **PostgreSQL**
*   **Flyway** (Migraciones de base de datos)
*   **Lombok**
*   **Maven**

[🔼 Volver al inicio](#inicio)

---

## 📐 Arquitectura del Sistema <a name="arquitectura-del-sistema"></a>

El proyecto implementa una arquitectura modular y limpia, dividiendo el sistema en módulos independientes.

```tree
back-intro/
├── application/             # Lógica de aplicación y casos de uso
├── domain/                  # Entidades del dominio y reglas de negocio
└── infrastructure/          # Detalles técnicos, Base de datos, API, etc.
    ├── src/main/java/com/backintro/infrastructure/adapters/out/persistence/entity/
    │   ├── PatientEntity.java
    │   ├── EncounterEntity.java
    │   └── ... (50 entidades más)
    └── src/main/resources/db/migration/
        ├── V0__create_uuid_extension.sql
        ├── V1__create_countries_table.sql
        └── ... (hasta V52)
```

[🔼 Volver al inicio](#inicio)

---

## 📋 Prerrequisitos <a name="prerrequisitos"></a>

Asegúrate de contar con lo siguiente instalado en tu entorno local:

*   **Java Development Kit (JDK)** versión 17 o superior.
*   **Maven** instalado y en el PATH del sistema.
*   **PostgreSQL** ejecutándose localmente o vía Docker.
*   **Git** para el control de versiones.

[🔼 Volver al inicio](#inicio)

---

## 🚀 Instalación <a name="instalación"></a>

Para configurar el proyecto localmente, sigue estos pasos:

**1. Clona el repositorio:**
```bash
git clone https://github.com/santiagoosorio0708e-wq/proyecto-spring.git
cd proyecto-spring
```

**2. Configura las variables de entorno:**
```bash
# Copia la plantilla y edita con tus credenciales
cp .env.template .env
```

**3. Compila el proyecto y descarga dependencias:**
```bash
mvn clean install
```

**4. Ejecuta la aplicación:**
```bash
mvn spring-boot:run
```

[🔼 Volver al inicio](#inicio)

---

## 💡 Uso y Características <a name="uso-y-características"></a>

- **Gestión Clínica:** Creación de tratamientos, planes y notas médicas.
- **Historial Seguro:** Las variables sensibles están protegidas usando variables de entorno y no se versionan.
- **Chats IA:** Arquitectura de mensajería lista para integrarse con modelos LLM.
- **Migraciones Automáticas:** El esquema se actualiza solo cada vez que arranca Spring Boot gracias a Flyway.

[🔼 Volver al inicio](#inicio)

---

## 🧪 Pruebas <a name="pruebas"></a>

Ejecutar las pruebas unitarias y de integración es muy sencillo:

```bash
mvn test
```

[🔼 Volver al inicio](#inicio)

---

## 🗺️ Hoja de Ruta (Roadmap) <a name="hoja-de-ruta"></a>

- [x] Configuración inicial del repositorio.
- [x] Diseño y creación de 52 tablas (Flyway).
- [x] Mapeo de Entidades JPA y relaciones.
- [ ] Implementación de Repositorios (Spring Data).
- [ ] Creación de Controladores REST.
- [ ] Seguridad e Integración con JWT.

[🔼 Volver al inicio](#inicio)

---

## 📫 Contacto <a name="contacto"></a>

**Desarrollador Principal:** [Tu Nombre / Santiago Osorio]  
**GitHub:** [@santiagoosorio0708e-wq](https://github.com/santiagoosorio0708e-wq)  
**Link del Proyecto:** [Proyecto Spring](https://github.com/santiagoosorio0708e-wq/proyecto-spring)

<div align="center">
  <p>Construido con ❤️ usando Spring Boot</p>
</div>

[🔼 Volver al inicio](#inicio)
