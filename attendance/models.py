from django.db import models
from datetime import datetime

class AttendanceRecord(models.Model):
    # Student information from QR code
    name = models.CharField(max_length=100)
    department = models.CharField(max_length=50)
    year = models.CharField(max_length=20)
    
    # Scanner information
    scanner_name = models.CharField(max_length=100, default="Unknown")
    scanner_location = models.CharField(max_length=100, blank=True, null=True)
    scanner_device = models.CharField(max_length=100, blank=True, null=True)
    
    # Timing information
    scan_date = models.DateField(auto_now_add=True)
    scan_time = models.TimeField(auto_now_add=True)
    created_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        unique_together = ['name', 'scan_date']  # One entry per person per day
    
    def __str__(self):
        return f"{self.name} - scanned by {self.scanner_name} on {self.scan_date}"
