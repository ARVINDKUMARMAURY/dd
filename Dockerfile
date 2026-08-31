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

# Install Python packages directly (no requirements.txt dependency hell)
RUN pip install --no-cache-dir \
    git+https://github.com/pytgcalls/pytgcalls.git \
    telethon>=1.28.0 \
    numpy>=1.21.0 \
    aiohttp>=3.8.0

# Copy your bot code
COPY bot.py .

# Run the bot
CMD ["python", "bot.py"]
