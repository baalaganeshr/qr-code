@echo off
REM QR Attendance System - Quick Setup Script for Windows
echo 🚀 Setting up QR Attendance System...

REM Check if Docker is available
docker --version >nul 2>&1
if %errorlevel% == 0 (
    docker-compose --version >nul 2>&1
    if %errorlevel% == 0 (
        echo ✅ Docker found. Using Docker setup...
        
        REM Build and start the application
        echo 📦 Building Docker image...
        docker-compose build
        
        echo 🏃 Starting application...
        docker-compose up -d
        
        echo 📊 Setting up database...
        docker-compose exec web python manage.py makemigrations attendance
        docker-compose exec web python manage.py migrate
        
        echo.
        echo 🎉 Setup complete!
        echo 🌐 Application is running at: http://localhost:8000
        echo 📱 Scanner page: http://localhost:8000/scanner/
        echo 📊 Records page: http://localhost:8000/records/
        echo.
        echo To stop the application: docker-compose down
        echo To view logs: docker-compose logs web
        goto :end
    )
)

REM Check if Python is available
python --version >nul 2>&1
if %errorlevel% == 0 (
    echo ✅ Python found. Using manual setup...
    
    REM Install dependencies
    echo 📦 Installing Python dependencies...
    pip install -r requirements.txt
    
    echo 📊 Setting up database...
    python manage.py makemigrations attendance
    python manage.py migrate
    
    echo.
    echo 🎉 Setup complete!
    echo 🏃 Starting Django development server...
    echo 🌐 Application will be available at: http://localhost:8000
    echo 📱 Scanner page: http://localhost:8000/scanner/
    echo 📊 Records page: http://localhost:8000/records/
    echo.
    echo Press Ctrl+C to stop the server
    echo.
    
    python manage.py runserver
    goto :end
)

echo ❌ Error: Neither Docker nor Python found on this system
echo Please install either:
echo   - Docker ^& Docker Compose, or
echo   - Python 3.11+ with pip

:end
pause
