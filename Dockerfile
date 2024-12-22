FROM rasa/rasa:3.6.20

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    python3-dev \
    libssl-dev \
    libffi-dev \
    && apt-get clean

# Copy the Rasa project into the Docker image
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Rasa will run on
EXPOSE 5005

# Run the Rasa server
CMD ["run", "-m", "models", "--enable-api", "--cors", "*"]
