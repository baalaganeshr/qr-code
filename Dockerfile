FROM python:3.11-slim

# Install system dependencies for QR code scanning
RUN apt-get update && apt-get install -y \
    libzbar0 \
    libzbar-dev \
    python3-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Create directory for Excel files
RUN mkdir -p /app/attendance_data

# Expose port
EXPOSE 8000

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
