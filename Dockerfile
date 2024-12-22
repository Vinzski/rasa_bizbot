# Use a specific Rasa image
FROM rasa/rasa:3.6.20-full

# Switch to root user to install dependencies
USER root

# Set working directory
WORKDIR /app

# Copy only necessary files first to optimize caching
COPY requirements.txt ./ 

# Upgrade pip and install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . /app

# Set permissions for the non-root user
RUN chown -R 1001:1001 /app

# Switch back to the non-root user
USER 1001

# Expose port for Rasa
EXPOSE 5005

# Run the Rasa server
# CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]
