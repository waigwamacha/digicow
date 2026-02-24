# Use a minimal base image for efficiency
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system-level dependencies (required by some packages)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libgl1 \
        libglib2.0-0 \
        libfreetype6 \
        libpng-dev \
        libopenblas-dev \
        libgomp1 \
        wget \
        curl \
        unzip \
        && rm -rf /var/lib/apt/lists/*

# Install Python packages via pip
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    scikit-learn \
    xgboost \
    #tensorflow==2.13.0 \
    catboost \
    #torch==2.3.0+cu118 torchvision==0.13.0+cu118 -f https://download.pytorch.org/whl/cu118/torch_stable.html \
    lightgbm \
    matplotlib \
    seaborn \
    optuna \
    jupyterlab \
    ipykernel \
    notebook \
    && pip install --upgrade pip

# Create a startup script to start Jupyter Lab
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose port for Jupyter
EXPOSE 8888

# Entry point: run Jupyter with password and token disabled (securely set later)
CMD ["/entrypoint.sh"]

