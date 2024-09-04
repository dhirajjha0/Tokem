FROM python:3.8-slim-buster

# Set the working directory
WORKDIR /app

# Update package lists and install git
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements file and install Python dependencies
COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port that the app runs on
EXPOSE 8080

# Define the command to run the application
CMD ["python3", "main.py"]
