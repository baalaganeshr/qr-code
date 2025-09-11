"""
URL configuration for qrsite project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from attendance.views import qr_card, scan_qr_code, download_excel, scanner_page, view_records

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', qr_card, name='qr_card'),
    path('scanner/', scanner_page, name='scanner'),
    path('scan-qr/', scan_qr_code, name='scan_qr'),
    path('download-excel/', download_excel, name='download_excel'),
    path('records/', view_records, name='view_records'),
]
