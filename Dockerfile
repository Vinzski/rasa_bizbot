FROM rasa/rasa:latest

# Copy the Rasa project into the Docker image
COPY . /app

# Install any additional dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Rasa will run on
EXPOSE 5005

# Run the Rasa server
CMD ["run", "-m", "models", "--enable-api", "--cors", "*"]
