# 🎯 Little Service App (Flutter + .NET 8)

Un proyecto universitario y de portfolio que replica la experiencia de **Fiverr**:  
una plataforma donde usuarios pueden **ofrecer servicios** y otros pueden **contratarlos**.

Este monorepo incluye:

- 📱 **Mobile App (Flutter)** → Aplicación multiplataforma (Android/iOS).
- ⚙️ **Backend API (.NET 8)** → API REST con autenticación, servicios y mensajería.

---

## 🏗️ Arquitectura del Monorepo

```plaintext
/little-service/
│── backend/              # API en .NET 8
│   ├── src/              # Código fuente
│   └── LittleService.sln         # Solution principal
│
│── mobile/               # App Flutter
│   ├── lib/              # Código fuente
│   └── pubspec.yaml      # Dependencias Flutter
│
│── docs/                 # Documentación adicional
│
│── .github/workflows/    # CI con GitHub Actions
│── README.md             # Este archivo
```

---

## 🚀 Tecnologías principales

- **Frontend (Mobile)**
    - [Flutter 3.x](https://flutter.dev/)
    - Riverpod (state management)
    - Freezed + JsonSerializable (modelos inmutables)
    - GoRouter (navegación declarativa)

- **Backend (API)**
    - [.NET 8 Web API](https://dotnet.microsoft.com/)
    - Entity Framework Core + SQL Server
    - Mediator (CQRS)
    - FluentValidation (validaciones)
    - Serilog (logging estructurado)
    - Swagger / OpenAPI (documentación)

- **Infraestructura**
    - Docker (contenedores para DB y API)
    - GitHub Actions (CI/CD)

---

## 🔧 Cómo correr el proyecto

### 1 Clonar el repo

```bash
git clone https://github.com/TU-USUARIO/little-service.git
cd little-service
```

### 2. Backend (.NET 8)

- **Requisitos**
    - .NET 8 SDK
    - Docker Desktop (para la base de datos)

**Pasos**

```bash
cd backend
dotnet restore
dotnet build
dotnet run --project src/LittleService.Api
```

    - La API estará disponible en: https://localhost:5001
    - Swagger UI: https://localhost:5001/swagger

### 3. Mobile (Flutter)

- **Requisitos**
    - Flutter SDK 3.x
    - Android Studio o Xcode

**Pasos**

```bash
cd mobile
flutter pub get
flutter run
```

## 🧪 CI/CD con GitHub Actions

- **Este monorepo incluye integración continua:**
    - Cada push corre tests de .NET 8 y Flutter.
    - Configuración en: .github/workflows/ci.yml.

## 📌 Roadmap (MVP)

- Registro y login de usuarios (cliente/freelancer).

- Perfiles con descripción, skills e imagen.

- Publicación de servicios.

- Búsqueda y contratación de servicios.

- Chat en tiempo real (SignalR).

- Reseñas y calificaciones.

- Notificaciones push.

## 👨‍💻 Autor

- **Proyecto desarrollado por Martin Rastrilla como iniciativa universitaria y de portfolio.**
