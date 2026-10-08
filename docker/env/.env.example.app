APP_NAME="mini-RAG"
APP_VERSION="0.1"

FILE_ALLOWED_TYPES=["text/plain", "application/pdf"]
FILE_MAX_SIZE=10
FILE_DEFAULT_CHUNK_SIZE=512000 # 512KB

POSTGRES_USERNAME="postgres"
POSTGRES_PASSWORD="your_postgres_password_here"
POSTGRES_HOST="pgvector"
POSTGRES_PORT=5432
POSTGRES_MAIN_DATABASE="minirag"

# ========================= LLM Config =========================
GENERATION_BACKEND="OPENAI"
EMBEDDING_BACKEND="COHERE"

OPENAI_API_KEY="your_openai_api_key_here"
OPENAI_API_URL="https://api.groq.com/openai/v1"
COHERE_API_KEY="your_cohere_api_key_here"

GENERATION_MODEL_ID_LITERAL=["llama3-8b-8192", "gemma2-9b-it", "qwen/qwen3.8-27b"]
GENERATION_MODEL_ID="qwen/qwen3.8-27b"
EMBEDDING_MODEL_ID="embed-multilingual-v3.0"
EMBEDDING_MODEL_SIZE=1024

INPUT_DAFAULT_MAX_CHARACTERS=1024
GENERATION_DAFAULT_MAX_TOKENS=200
GENERATION_DAFAULT_TEMPERATURE=0.1

# ========================= Vector DB Config =========================
VECTOR_DB_BACKEND_LITERAL=["QDRANT", "PGVECTOR"]
VECTOR_DB_BACKEND="PGVECTOR"
VECTOR_DB_PATH="qdrant_db"
VECTOR_DB_DISTANCE_METHOD="cosine"
VECTOR_DB_PGVEC_INDEX_THRESHOLD=100

# ========================= Template Config =========================
PRIMARY_LANG="en"
DEFAULT_LANG="en"

# ========================= Celery Task Queue Config =========================
CELERY_BROKER_URL="amqp://minirag_user:your_rabbitmq_password_here@rabbitmq:5672/minirag_vhost"
CELERY_RESULT_BACKEND="redis://:your_redis_password_here@redis:6379/0"
CELERY_TASK_SERIALIZER="json"
CELERY_TASK_TIME_LIMIT=600
CELERY_TASK_ACKS_LATE=false
CELERY_WORKER_CONCURRENCY=2
CELERY_FLOWER_PASSWORD="your_flower_password_here"