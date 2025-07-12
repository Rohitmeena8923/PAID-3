FROM python:3.9-slim

WORKDIR /app
COPY . .

RUN apt-get update && apt-get install -y \
    ffmpeg \
    aria2 \
    gcc \
    g++ \
    cmake \
    unzip \
    make \
    wget \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Install Bento4's mp4decrypt
RUN wget -q https://github.com/axiomatic-systems/Bento4/archive/v1.6.0-639.zip && \
    unzip v1.6.0-639.zip && \
    cd Bento4-1.6.0-639 && \
    mkdir build && cd build && \
    cmake .. && make -j$(nproc) && \
    cp mp4decrypt /usr/local/bin/ && \
    cd /app && rm -rf Bento4-1.6.0-639 v1.6.0-639.zip

# Install Python deps
RUN pip install --upgrade pip && \
    pip install -r sainibots.txt && \
    pip install yt-dlp

CMD ["supervisord", "-c", "/app/supervisord.conf"]