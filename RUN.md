# Product Inventory Management System — Setup Guide

## Prerequisites

- [Docker Desktop](https://docs.docker.com/get-docker/) installed and running

---

## Quick Start (Docker)

```bash
docker compose up --build
```

That's it. Three services will start:

| Service    | URL                          |
|------------|------------------------------|
| Frontend   | http://localhost:4200        |
| Backend API| http://localhost:5050        |
| PostgreSQL | localhost:5432 (HCL-LMS db) |

Wait for the backend to finish starting (watch the logs for `Started InventoryManagementSystem`). Then open http://localhost:4200 in your browser.

### Seed the database 

Load sample tech product data (32 products, 8 suppliers, 74 transactions, March-April 2026):

```bash
docker compose exec -T db psql -U postgres -d "HCL-LMS" < seed.sql
```

All seeded users share the password: `Admin@123`

| User        | Email              | Role                |
|-------------|--------------------|---------------------|
| ayush       | ayush@gmail.com    | Admin               |
| smriti      | smriti@gmail.com   | Admin               |
| palak       | palak@gmail.com    | Admin               |
| abhishek    | abhishek@gmail.com | Admin               |
| parth       | parth@gmail.com    | Admin               |
| ramkrishna  | ramkrishna@gmail.com | Admin             |
| abhay       | abhay@gmail.com    | Admin               |
| raja rao    | rajarao@gmail.com  | Admin               |
| naman       | naman@gmail.com    | Admin               |
| raman       | raman@gmail.com    | Admin               |
| officer     | officer@ims.io     | Procurement Officer |
| manager     | manager@ims.io     | Warehouse Manager   |
| staff       | staff@ims.io       | Staff               |
| dev         | dev@ims.io         | Staff               |

> Memory note: `docker-compose.yml` sets both `backend` and `frontend` containers to `8g`. If Docker Desktop has a lower global memory allocation, increase it in Docker Desktop settings so these limits can actually be used.

### Useful Docker commands

```bash
# Start in detached mode (background)
docker compose up -d --build

# View logs
docker compose logs -f backend
docker compose logs -f frontend

# Stop everything
docker compose down

# Stop and wipe database data
docker compose down -v
```

---

## Manual Setup (without Docker)

### 1. Install dependencies

```bash
# macOS (Homebrew)
brew install openjdk@21 maven postgresql@16 node@22
```

### 2. Configure environment

Add to your `~/.zshrc`:

```bash
export PATH="/opt/homebrew/opt/openjdk@21/bin:/opt/homebrew/opt/postgresql@16/bin:$PATH"
export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
```

Then reload: `source ~/.zshrc`

### 3. Set up PostgreSQL

```bash
brew services start postgresql@16
createdb "HCL-LMS"
psql -d "HCL-LMS" -c "CREATE ROLE postgres WITH LOGIN PASSWORD '2004' SUPERUSER;"
psql -d "HCL-LMS" -c "GRANT ALL PRIVILEGES ON DATABASE \"HCL-LMS\" TO postgres;"
psql -d "HCL-LMS" -c "GRANT ALL PRIVILEGES ON SCHEMA public TO postgres;"
```

### 4. Start the backend

```bash
cd HCL-LMS--master/backend
mvn spring-boot:run
```

Backend runs on http://localhost:5050

### 5. Start the frontend

```bash
cd HCL-LMS--master/frontend
npm install
npx ng serve
```

Frontend runs on http://localhost:4200

---

## Project Structure

```
.
├── docker-compose.yml          # Docker orchestration
├── seed.sql                    # Database seeding script
├── RUN.md                      # This file
└── HCL-LMS--master/
    ├── backend/                # Spring Boot (Java 21, port 5050)
    │   ├── Dockerfile
    │   ├── pom.xml
    │   └── src/
    └── frontend/               # Angular 18 (port 4200)
        ├── Dockerfile
        ├── nginx.conf
        ├── package.json
        └── src/
```
