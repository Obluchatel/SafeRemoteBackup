# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy application files
COPY app/ /app/
COPY requirements.txt /app/requirements.txt

# Install Flask
RUN pip install --no-cache-dir -r requirements.txt


# Ensure the upload folder is writable
RUN mkdir -p /app/static/uploads && chmod -R 777 /app/static/uploads

# Expose the Flask app port
EXPOSE 5000

# Command to run the Flask app
CMD ["bash", "starting_script.sh"]
