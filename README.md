# 🧩 Inetum -- Prueba Técnica Senior Full Stack

## 📌 Descripción General

Este proyecto implementa una arquitectura basada en microservicios
utilizando:

-   Ruby on Rails (API only)
-   PostgreSQL
-   RabbitMQ
-   Next.js
-   Docker Compose

El sistema está compuesto por:

-   🛒 Order Service
-   👤 Customer Service
-   🖥 Frontend Next.js

Incluye comunicación HTTP entre servicios y arquitectura event-driven.

------------------------------------------------------------------------

# 🏗 Arquitectura

NextJS → Order Service → Customer Service → PostgreSQL\
Order Service → RabbitMQ → Customer Service

------------------------------------------------------------------------

# 🛒 Order Service

## Funcionalidades

-   Crear pedidos
-   Consultar pedidos por customer_id (paginación 20 por página)
-   Consumir Customer Service vía HTTP
-   Publicar evento order.created en RabbitMQ

## Endpoints

POST /orders\
GET /orders?customer_id=1&page=0

------------------------------------------------------------------------

# 👤 Customer Service

## Funcionalidades

-   Consultar información del cliente
-   Mantener orders_count
-   Consumir eventos desde RabbitMQ

GET /customers/:id

Clientes precargados vía seeds.

------------------------------------------------------------------------

# 📡 Arquitectura Event-Driven

Exchange: orders_exchange\
Routing key: order.created

Al crearse un pedido: 1. Se guarda en Order Service 2. Se publica evento
3. Customer Service actualiza orders_count

------------------------------------------------------------------------

# 🗄 Base de Datos

PostgreSQL separado por microservicio: - orders_db - customers_db

Migraciones y seeds incluidos.

------------------------------------------------------------------------

# 🧪 Pruebas

RSpec para: - Creación de pedidos - Consulta - Integración HTTP -
Eventos

Ejecutar:

bundle install\
rails db:create db:migrate db:seed\
rspec

------------------------------------------------------------------------

# 🐳 Docker

docker-compose up --build

Servicios: - order-service - customer-service - postgres - rabbitmq

------------------------------------------------------------------------

# 🖥 Frontend NextJS

Funcionalidades: - Listado paginado (20 registros) - Crear pedido

Ejecutar:

cd frontend-nextjs\
npm install\
npm run dev

------------------------------------------------------------------------

# 🎯 Cobertura de Criterios

✔ Arquitectura desacoplada\
✔ Event-driven\
✔ Comunicación HTTP\
✔ PostgreSQL\
✔ RSpec\
✔ Documentación clara

------------------------------------------------------------------------

# 🚀 Mejoras Futuras

-   JWT
-   Swagger
-   CI/CD
-   Dead Letter Queues
-   Reporte de cobertura

------------------------------------------------------------------------

Proyecto preparado para Prueba técnica-Proceso de Selección Desarrollador Senior Full Stack Inetum.