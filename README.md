# Mini-RAG System

A scalable and efficient Retrieval-Augmented Generation (RAG) backend API for document processing, semantic search, and question answering. Built with FastAPI, PostgreSQL (PgVector), Celery, and Docker.

## System Requirements

- Python 3.10
- Docker & Docker Compose

## Setup & Installation

### 1. Install System Dependencies (Linux/WSL)
sudo apt update
sudo apt install libpq-dev gcc python3-dev

### 2. Environment Setup (MiniConda)
Create and activate an isolated environment:

conda create -n mini-rag python=3.10
conda activate mini-rag

### 3. Install Python Packages
pip install -r requirements.txt

### 4. Environment Variables & Database Migration
cp .env.example .env

# Note: Update the .env file with your specific credentials (e.g., OPENAI_API_KEY, Database credentials)

alembic upgrade head

## Running the Services

### Docker Compose (Production/Full Stack)
To spin up all services including databases, messaging queues, and monitoring tools:

cd docker
cp .env.example .env

# Update .env with your credentials

sudo docker compose up -d

#### Access Points:
- FastAPI (Swagger UI): http://localhost:8000
- Flower Dashboard: http://localhost:5555 (admin/password from env)
- Grafana: http://localhost:3000
- Prometheus: http://localhost:9090

---

### Local Development Mode

If you prefer running services manually for debugging:

1. Run FastAPI Server:
uvicorn main:app --reload --host 0.0.0.0 --port 8000

2. Run Celery Services (Separate Terminals):

- Worker:
python -m celery -A celery_app worker --queues=default,file_processing,data_indexing --loglevel=info

- Beat Scheduler:
python -m celery -A celery_app beat --loglevel=info

- Flower Dashboard:
python -m celery -A celery_app flower --conf=flowerconfig.py

## API Testing

Download the POSTMAN collection to test the endpoints: 
/assets/mini-rag-app.postman_collection.json