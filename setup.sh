#!/bin/bash

# QR Attendance System - Quick Setup Script
echo "🚀 Setting up QR Attendance System..."

# Check if Docker is available
if command -v docker &> /dev/null && command -v docker-compose &> /dev/null; then
    echo "✅ Docker found. Using Docker setup..."
    
    # Build and start the application
    echo "📦 Building Docker image..."
    docker-compose build
    
    echo "🏃 Starting application..."
    docker-compose up -d
    
    echo "📊 Setting up database..."
    docker-compose exec web python manage.py makemigrations attendance
    docker-compose exec web python manage.py migrate
    
    echo ""
    echo "🎉 Setup complete!"
    echo "🌐 Application is running at: http://localhost:8000"
    echo "📱 Scanner page: http://localhost:8000/scanner/"
    echo "📊 Records page: http://localhost:8000/records/"
    echo ""
    echo "To stop the application: docker-compose down"
    echo "To view logs: docker-compose logs web"

elif command -v python3 &> /dev/null; then
    echo "✅ Python found. Using manual setup..."
    
    # Install dependencies
    echo "📦 Installing Python dependencies..."
    pip install -r requirements.txt
    
    echo "📊 Setting up database..."
    python manage.py makemigrations attendance
    python manage.py migrate
    
    echo ""
    echo "🎉 Setup complete!"
    echo "🏃 Starting Django development server..."
    echo "🌐 Application will be available at: http://localhost:8000"
    echo "📱 Scanner page: http://localhost:8000/scanner/"
    echo "📊 Records page: http://localhost:8000/records/"
    echo ""
    echo "Press Ctrl+C to stop the server"
    echo ""
    
    python manage.py runserver

else
    echo "❌ Error: Neither Docker nor Python3 found on this system"
    echo "Please install either:"
    echo "  - Docker & Docker Compose, or"
    echo "  - Python 3.11+ with pip"
    exit 1
fi
