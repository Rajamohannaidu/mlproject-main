FROM python:3.10-slim-bullseye

WORKDIR /app

COPY . /app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        awscli \
        ffmpeg \
        libsm6 \
        libxext6 \
        unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]
