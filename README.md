
# Orders & Customers

## Run
docker-compose up --build

Order:3001
Customer:3002
Frontend:3000

## Flow
Order -> HTTP Customer -> Save -> RabbitMQ -> Customer increments orders_count

## Pagination
/orders?customer_id=1&page=1 (20 per page)

## Tests
docker compose exec order-service bundle exec rspec
docker compose exec customer-service bundle exec rspec

## Diagram

Order Service --> Customer Service (HTTP)
Order Service --> RabbitMQ --> Customer Service
