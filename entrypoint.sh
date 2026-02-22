#!/bin/bash
set -e

# Set a default password (replace this in production with dynamic generation)
PASSWORD="${JUPYTER_PASSWORD:-your_secure_password_here}"

# Validate that the password is actually provided
if [ -z "$PASSWORD" ]; then
  echo "Error: JUPYTER_PASSWORD must be set!" >&2
  exit 1
fi

# Start Jupyter Lab with secure settings
jupyter lab \
  --ip=0.0.0.0 \
  --port=8888 \
  --no-browser \
  --allow-root \
  --NotebookApp.token='' \
  --NotebookApp.password="$PASSWORD" \
  --NotebookApp.token=''

# Wait for Jupyter to start (optional: add loop if needed)
echo "Jupyter Lab is running at http://localhost:8888"

