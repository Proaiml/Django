# Django Web Sitesi — mywebsite

[![Python 3.8+](https://img.shields.io/badge/python-3.8+-blue.svg)](https://www.python.org/)
[![Django 4.2+](https://img.shields.io/badge/django-4.2+-092e20.svg)](https://www.djangoproject.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

Bu proje, Python'ın popüler web çatısı **Django**'nun temel mimarisi olan **MVT (Model-View-Template)** yapısını, **Sınıf Tabanlı Görünümleri (Class-Based Views - CBV)** ve **Şablon Kalıtımını (Template Inheritance)** uygulamalı olarak gösteren modüler bir web sitesi çalışmasıdır.

---

## 🌐 Sayfa ve Rota Yapısı

| Rota (URL) | Görünüm Sınıfı | Şablon | Açıklama |
| :--- | :--- | :--- | :--- |
| `/` | `HomePageView` | `home.html` | Anasayfa karşılama ekranı |
| `/about/` | `AboutPageView` | `about.html` | Kurumsal hakkımızda tanıtım sayfası |
| `/admin/` | Django Admin | Yerleşik | Django dahili yönetim paneli |

---

## 🏗️ Proje Mimarisi

```
Django/
│
├── run_server.bat         # Sunucuyu ve tarayıcıyı tek tıkla başlatan Windows scripti
├── requirements.txt       # Python bağımlılıkları (Django)
├── .gitignore             # Git dışlama kuralları
├── README.md              # Proje dokümantasyonu
│
└── jang/                  # Django proje kök dizini
    ├── manage.py          # Django yönetim CLI aracı
    ├── db.sqlite3         # SQLite veritabanı
    │
    ├── mywebsite/         # Ana proje yapılandırması
    │   ├── settings.py    # Uygulama ayarları & şablon dizinleri
    │   ├── urls.py        # Ana URL yönlendiricisi (pages.urls dahil)
    │   ├── asgi.py        # Asenkron web sunucusu arabirimi
    │   └── wsgi.py        # WSGI web sunucusu arabirimi
    │
    ├── pages/             # Sayfa yönetimi uygulaması (App)
    │   ├── views.py       # TemplateView tabanlı sınıf görünümleri
    │   ├── urls.py        # Sayfa içi URL rotaları
    │   ├── models.py      # Veritabanı modelleri
    │   └── admin.py       # Admin arayüzü kayıtları
    │
    └── templates/         # HTML şablonları
        ├── base.html      # Ortak menü ve iskelet (Template Inheritance)
        ├── home.html      # Anasayfa içeriği ({% extends 'base.html' %})
        └── about.html     # Hakkımızda içeriği ({% extends 'base.html' %})
```

---

## 🚀 Hızlı Başlangıç

### 1. Tek Tıkla Başlatma (Windows)
Doğrudan **`run_server.bat`** dosyasına çift tıklayın. 
Script gerekli kontrolleri yapacak, geliştirme sunucusunu başlatacak ve tarayıcınızda otomatik olarak **`http://127.0.0.1:8000`** adresini açacaktır.

---

### 2. Komut Satırından Başlatma

#### Bağımlılıkları Yükleyin:
```bash
pip install -r requirements.txt
```

#### Sunucuyu Çalıştırın:
```bash
cd jang
python manage.py runserver
```

Tarayıcınızdan **`http://127.0.0.1:8000/`** adresini ziyaret edebilirsiniz.

---

## 💡 Öne Çıkan Django Özellikleri

1. **Class-Based Views (CBV):** Standart fonksiyonel görünümler (`def home(request)`) yerine, Django'nun `TemplateView` sınıfı kullanılarak daha temiz ve genişletilebilir bir kod yapısı oluşturulmuştur:
   ```python
   from django.views.generic import TemplateView

   class HomePageView(TemplateView):
       template_name = "home.html"
   ```

2. **Şablon Kalıtımı (DRY Prensibi):** `base.html` içerisinde ortak menü barındırılmış; `home.html` ve `about.html` sayfaları bu yapıyı `{% extends "base.html" %}` ile miras alarak kod tekrarını önlemiştir.

---

## 👨‍💻 Yazar

- **İlhan Koçaslan** — [GitHub: @Proaiml](https://github.com/Proaiml)
