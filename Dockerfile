# Use official Python image
FROM python:3.10-slim

# Install system dependencies (for pytesseract)
RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the port Flask runs on
EXPOSE 5000

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Run the app (adjust if needed)
CMD ["python", "app.py"]