FROM python:3.10-slim

# System dependencies (ffmpeg, compilers)
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    python3-dev \
    ffmpeg \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install Python packages with pinned versions
RUN pip install --no-cache-dir \
    py-tgcalls==2.2.12 \
    telethon==1.34.0 \
    numpy==1.26.4 \
    aiohttp==3.9.5

# Copy your bot code
COPY bot.py .

# Run the bot
CMD ["python", "bot.py"]
