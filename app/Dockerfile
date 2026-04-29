# Using an official lightweight Python image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy project files into the container
COPY . /app

# Install dependencies
RUN pip install -r requirements.txt

# Expose port 5001 for Flask
EXPOSE 5001

# Command to run the app
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "5001", "--debug"]



