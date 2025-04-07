# Start with a base image
FROM python:3.9-slim

# Set the working directory
WORKDIR /opt/cuteblog

# Copy the application files into the container
COPY . /opt/cuteblog

# Install the required dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the necessary port
EXPOSE 5000

# Command to run the Flask app
CMD ["python3", "app.py"]

