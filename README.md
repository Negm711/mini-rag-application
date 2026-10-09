# 🧠 RAG-System API

> A production-ready, cloud-native Retrieval-Augmented Generation (RAG) backend API engineered for high throughput, seamless scalability, and asynchronous document processing.

## 🏗️ Architecture Overview

This project implements a **decoupled, microservices-oriented architecture** to ensure robust performance:

- **API Layer**: Built with **FastAPI** to serve high-performance REST endpoints and interactive OpenAPI documentation.
- **Asynchronous Task Queue**: Powered by **Celery**, using **RabbitMQ** as the message broker and **Redis** for the result backend. Heavy I/O bound tasks (LLM generation, vector embedding, and document chunking) are offloaded to background workers to guarantee non-blocking API performance.
- **Vector Database**: Utilizes **PostgreSQL with the `pgvector` extension** (hosted on Supabase) for reliable vector storage and semantic search using cosine similarity.
- **AI Integration**: Integrates Cohere for dense vector embeddings and Groq/OpenAI models for rapid text generation.
- **Containerization**: Fully containerized environment via **Docker** and **Docker Compose**, separating application logic from infrastructure services for straightforward cloud deployment.

## 🚀 Key Features

- **True Asynchronous Processing**: Complete separation of API request handling and heavy AI task execution.
- **High-Performance Semantic Search**: Native vector indexing and retrieval via pgvector.
- **Stateless Core API**: Database, Cache, and Message Brokers are externally managed, making the API fully stateless and scalable.
- **Ready for Cloud Deployment**: Pre-configured CI/CD workflows and decoupled infrastructure setup.

## 🛠️ Tech Stack

- **Backend Framework**: Python 3.10, FastAPI, Uvicorn, Pydantic
- **AI Providers**: Cohere (Embeddings), Groq (Generation)
- **Database**: PostgreSQL + pgvector (Supabase)
- **Message Broker & Caching**: RabbitMQ (CloudAMQP), Redis (Upstash)
- **DevOps & Monitoring**: Docker, Docker Compose, GitHub Actions, Prometheus, Nginx

## 📂 Exact Project Structure

```text
RAG-System/
├── .github/workflows/       # CI/CD pipelines for automated deployment
├── docker/                  # Infrastructure configurations
│   ├── env/                 # Environment variables for infrastructure
│   ├── mongodb/             # MongoDB configurations
│   ├── nginx/               # Reverse proxy settings
│   ├── prometheus/          # Telemetry and monitoring setup
│   ├── rabbitmq/            # Message broker configuration
│   └── docker-compose.yml   # Spins up all local supporting services
├── mongodb/                 # Database initialization scripts
├── src/                     # Core Application logic
│   ├── assets/              # Postman collections and static files
│   ├── controllers/         # Endpoint request handling
│   ├── helpers/             # Shared utility functions
│   ├── models/              # Pydantic schemas and DB entities
│   ├── routes/              # FastAPI route registrations
│   ├── stores/              # Vector database interface implementations
│   ├── tasks/               # Celery worker tasks
│   ├── utils/               # App-wide utilities
│   ├── main.py              # Application entry point
│   ├── celery_app.py        # Celery initialization
│   ├── flowerconfig.py      # Flower dashboard configuration
│   └── requirements.txt     # Python dependencies
└── README.md                # Project documentation
```

## ⚙️ Environment Configuration

Create a `.env` file in the root directory to connect external services:

```env
# Database (Supabase)
POSTGRES_USERNAME="postgres"
POSTGRES_PASSWORD="<your_password>"
POSTGRES_HOST="<your_supabase_host>"
POSTGRES_PORT=5432
POSTGRES_MAIN_DATABASE="postgres"

# AI Service Providers
OPENAI_API_KEY="<your_groq_or_openai_key>"
OPENAI_API_URL="[https://api.groq.com/openai/v1](https://api.groq.com/openai/v1)"
COHERE_API_KEY="<your_cohere_key>"

# Task Queue (CloudAMQP & Upstash)
CELERY_BROKER_URL="<your_rabbitmq_url>"
CELERY_RESULT_BACKEND="<your_redis_url>"

# Vector Search Configuration
VECTOR_DB_BACKEND="PGVECTOR"
VECTOR_DB_DISTANCE_METHOD="cosine"
```

## 🐳 Deployment & Execution

**Containerized Execution:**
```bash
cd src
docker build -t rag-system-api .
docker run -p 8000:8000 --env-file .env rag-system-api
```
Access the interactive API documentation at `http://localhost:8000/docs`.