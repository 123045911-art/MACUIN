FROM python:3.11-slim

WORKDIR /app

# Instalación de herramientas de sistema para MySQL
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc default-libmysqlclient-dev pkg-config && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

# Uvicorn arranca la aplicación 'app' dentro de 'main.py'
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]