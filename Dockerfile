FROM python:3.9.6-alpine3.14

WORKDIR /app

COPY . .

RUN apk add --no-cache \
    gcc \
    libffi-dev \
    musl-dev \
    ffmpeg \
    aria2 \
    make \
    g++ \
    cmake \
    unzip \
    wget \
    supervisor && \
    wget -q https://github.com/axiomatic-systems/Bento4/archive/v1.6.0-639.zip && \
    unzip v1.6.0-639.zip && \
    cd Bento4-1.6.0-639 && \
    mkdir build && cd build && \
    cmake .. && make -j$(nproc) && \
    cp mp4decrypt /usr/local/bin/ && \
    cd /app && rm -rf Bento4-1.6.0-639 v1.6.0-639.zip

RUN pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir -r sainibots.txt \
    && python3 -m pip install -U yt-dlp

CMD ["supervisord", "-c", "/app/supervisord.conf"]