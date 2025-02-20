# Use the Ollama base image (contains Mixtral)
FROM ollama/ollama

# Install Python and required dependencies
RUN apt update && apt install -y python3 python3-pip
RUN pip3 install fastapi uvicorn

# Copy application files into the container
COPY main.py /app/main.py
WORKDIR /app

# Expose the API on port 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
