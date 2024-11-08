# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Install git to clone the repositories
RUN apt-get update && apt-get install -y git

# Clone the repositories
RUN git clone https://github.com/commune-ai/commune.git
RUN git clone https://github.com/commune-ai/agent.git

# Install the Python dependencies for both repositories
WORKDIR /app/commune
RUN pip install -e .

WORKDIR /app/agent
RUN pip install -e .

# Set the working directory to /app/agent
WORKDIR /app/agent

# Expose any ports your app may need (adjust if necessary)
EXPOSE 5000

# Run the main.py script when the container starts
CMD ["python", "main.py"]
