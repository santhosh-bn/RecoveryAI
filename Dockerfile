FROM python:3.11-slim

WORKDIR /app

# Install build dependencies if needed (e.g., for xgboost/pandas on some architectures)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
