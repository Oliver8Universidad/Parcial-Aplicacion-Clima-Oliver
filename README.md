# 🌤️ Examen Final – Aplicación Web del Clima (Flutter + Docker + Vercel)

## 📌 Descripción del Proyecto

Este proyecto consiste en una **aplicación web de clima desarrollada en Flutter**, contenerizada con **Docker**, orquestada mediante **Docker Compose** y publicada públicamente usando un **dominio gratuito en Vercel**.

La aplicación permite consultar información climática básica como:

* Temperatura
* Humedad
* Viento
* Amanecer y atardecer

El objetivo principal es demostrar el uso de tecnologías modernas de despliegue y publicación de aplicaciones.

---

## 🛠️ Tecnologías Utilizadas

* **Flutter (Web)** – Desarrollo de la aplicación
* **Dart** – Lenguaje base
* **Docker** – Contenerización
* **Docker Compose** – Orquestación
* **Vercel** – Publicación en dominio gratuito
* **GitHub** – Control de versiones

---

## 🐳 Dockerfile

El proyecto utiliza un **Dockerfile multi-stage**:

1. **Stage 1:** Compila la aplicación Flutter Web
2. **Stage 2:** Sirve la aplicación usando NGINX

Esto permite una imagen más ligera y optimizada.

---

## 🔁 Orquestación con Docker Compose

Se utiliza `docker-compose.yml` para:

* Construir la imagen
* Ejecutar el contenedor
* Exponer el servicio en el puerto 80

### Comandos principales:

```bash
docker-compose build
docker-compose up
```

La aplicación queda disponible en:

```
http://localhost
```

---

## 🌍 Publicación en Dominio Gratuito (Vercel)

La aplicación fue publicada usando **Vercel**, enlazando directamente el repositorio de GitHub.

🔗 **URL pública:**
👉 [https://examen-final-oliver.vercel.app/](https://examen-final-oliver.vercel.app/)

Características:

* Acceso público desde cualquier dispositivo
* No depende de que la computadora local esté encendida
* Servicio gratuito

---

## 📋 Requisitos para Ejecutar Localmente

* Docker Desktop instalado
* Docker Compose habilitado

No es necesario instalar Flutter localmente para ejecutar el contenedor.

---

## 👨‍🎓 Autor

**Oliver González**
Examen Final – Aplicaciones Móviles II
