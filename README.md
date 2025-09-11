# QR Code Attendance System

A Django-based QR code attendance tracking system with Excel export functionality.

## 🚀 Features

- **QR Code Generation**: Create QR codes with student information and current date
- **QR Code Scanning**: Upload and scan QR code images to mark attendance  
- **Excel Export**: Automatic saving to Excel file with attendance records
- **Scanner Tracking**: Records who scanned the QR code and when
- **Docker Support**: Containerized application for easy deployment
- **Database Storage**: SQLite database to track attendance (prevents duplicates)
- **Web Interface**: Easy-to-use web interface for all operations

## 📦 What's Included

### Main Files:
- `manage.py` - Django management script
- `requirements.txt` - Python dependencies
- `Dockerfile` - Docker container configuration
- `docker-compose.yml` - Docker Compose setup
- `README.md` - This file
- `test-instructions.html` - Step-by-step testing guide

### Applications:
- `qrsite/` - Main Django project settings
- `attendance/` - Attendance tracking Django app
  - `models.py` - Database models for attendance records
  - `views.py` - Application logic and API endpoints
  - `templates/` - HTML templates for web interface

## 🛠️ Setup Instructions

### Prerequisites:
- Docker and Docker Compose installed
- OR Python 3.11+ with pip

### Option 1: Docker Setup (Recommended)

1. Extract the zip file to a folder
2. Open terminal/command prompt in the folder
3. Run the following commands:

```bash
# Build the Docker image
docker-compose build

# Start the application
docker-compose up -d

# Run database migrations
docker-compose exec web python manage.py makemigrations attendance
docker-compose exec web python manage.py migrate
```

4. Access the application at: http://localhost:8000

### Option 2: Manual Setup

1. Extract the zip file to a folder
2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Run migrations:

```bash
python manage.py makemigrations attendance
python manage.py migrate
```

4. Start the server:

```bash
python manage.py runserver
```

5. Access the application at: http://localhost:8000

## 📱 How to Use

### Step 1: Generate QR Code
1. Go to http://localhost:8000
2. Click "Generate QR Code" button
3. Take a screenshot of the QR code

### Step 2: Scan QR Code
1. Go to http://localhost:8000/scanner/
2. Enter scanner name (required - who is scanning)
3. Enter location (optional - where scanning is happening)
4. Upload the QR code image
5. Click "Scan QR Code"

### Step 3: View Results
1. Check success message for confirmation
2. Visit http://localhost:8000/records/ to see all records
3. Click "Download Excel" to get Excel file with attendance data

## 📊 Excel File Structure

The Excel file contains the following columns:
- **Student Name**: Name from QR code
- **Department**: Department from QR code  
- **Year**: Year from QR code
- **Scanned By**: Name of person who scanned
- **Scanner Location**: Where the scan happened
- **Scanner Device**: Browser/device information
- **Date**: Date of scan
- **Time**: Time of scan
- **Full Timestamp**: Complete date and time

## 🌐 Available URLs

- `/` - Home page (QR code generator)
- `/scanner/` - QR code scanner page
- `/records/` - View all attendance records
- `/download-excel/` - Download Excel file
- `/admin/` - Django admin interface

## 🔧 Technical Details

### Technologies Used:
- **Backend**: Django 5.2+
- **QR Processing**: qrcode, pyzbar, opencv-python
- **Excel Generation**: openpyxl
- **Database**: SQLite (default)
- **Containerization**: Docker

### Key Features:
- **Duplicate Prevention**: One attendance record per student per day
- **Real-time Processing**: Immediate QR scanning and database updates
- **File Management**: Automatic Excel file creation and updates
- **Error Handling**: Comprehensive error messages and validation
- **Responsive Design**: Works on desktop and mobile devices

## 🚀 Deployment

### For Production:
1. Change DEBUG to False in qrsite/settings.py
2. Set proper ALLOWED_HOSTS in settings.py
3. Use a production database (PostgreSQL/MySQL)
4. Use a proper web server (nginx + gunicorn)
5. Set up SSL/HTTPS

### Docker Commands:
```bash
# Start application
docker-compose up -d

# Stop application  
docker-compose down

# View logs
docker-compose logs web

# Restart application
docker-compose restart

# Shell access
docker-compose exec web bash
```

## 🐛 Troubleshooting

### Common Issues:

1. **Port 8000 already in use**:
   - Change port in docker-compose.yml or stop other services

2. **Excel file not downloading**:
   - Make sure you've scanned at least one QR code
   - Check that attendance_data folder has proper permissions

3. **QR scanning fails**:
   - Ensure image is clear and contains a valid QR code
   - Make sure scanner name is entered (required field)

4. **Database errors**:
   - Run migrations: `docker-compose exec web python manage.py migrate`

## 📞 Support

If you encounter any issues:
1. Check the troubleshooting section above
2. Review Docker logs: `docker-compose logs web`
3. Ensure all dependencies are properly installed
4. Verify QR code image is clear and readable

## 📄 License

This project is provided as-is for educational and commercial use.

---

**Created**: September 11, 2025
**Version**: 1.0.0
**Author**: AI Assistant

A simple Django application that generates QR codes containing the current date for attendance purposes.

## Features

- Clean, modern UI matching your design requirements
- Student details: M.Abinaya, Bsc.CS, 3rd year
- Generates QR codes that contain all student information plus current date
- When scanned, the QR code will display:
  - Name: M.Abinaya
  - Department: Bsc.CS
  - Year: 3rd year
  - Date: Current date (YYYY-MM-DD format)
- No database required - keeps it simple

## Setup Instructions

1. **Activate the virtual environment:**
   ```
   .\venv\Scripts\Activate.ps1
   ```

2. **Install dependencies (already done):**
   ```
   pip install -r requirements.txt
   ```

3. **Run the server:**
   ```
   python manage.py runserver
   ```

4. **Open your browser and go to:**
   ```
   http://127.0.0.1:8000/
   ```

## How to Use

1. Open the application in your browser
2. Click the "Generate QR Code" button
3. The card will display:
   - Student name: M.Abinaya
   - Department: Bsc.CS
   - Year: 3rd year
   - Current date
   - In Time: Not marked
   - Out Time: Not marked
   - A QR code containing only today's date

4. Scan the QR code with any QR scanner - it will show all student information:
   ```
   Name: M.Abinaya
   Department: Bsc.CS
   Year: 3rd year
   Date: 2025-09-07
   ```

## Technical Details

- **Framework:** Django 5.2.6
- **QR Library:** qrcode[pil]
- **Image Processing:** Pillow
- **QR Content:** Student information + current date in ISO format
- **No Database:** All data is static except for the generated date

## Files Structure

```
qr/
├── qrsite/              # Django project settings
├── attendance/          # Django app
│   ├── views.py         # Main view logic
│   └── templates/       # HTML templates
├── manage.py           # Django management script
└── requirements.txt    # Python dependencies
```

The QR code will always contain just the current date when generated, making it perfect for attendance tracking systems that only need to know when the QR was created.
