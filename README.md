# 🎓 Learning Management System (LMS)

A comprehensive Learning Management System built with Django and Django REST Framework, featuring user authentication, course management, interactive quizzes, and responsive design.

[![Python](https://img.shields.io/badge/Python-3.9+-blue.svg)](https://www.python.org/)
[![Django](https://img.shields.io/badge/Django-5.2.5-green.svg)](https://www.djangoproject.com/)
[![Bootstrap](https://img.shields.io/badge/Bootstrap-5.3.3-purple.svg)](https://getbootstrap.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Technology Stack](#-technology-stack)
- [Installation](#-installation)
- [Usage](#-usage)
- [API Documentation](#-api-documentation)
- [Project Structure](#-project-structure)
- [Contributing](#-contributing)
- [License](#-license)

## 🎯 Overview

This Learning Management System (LMS) is a full-featured web application that enables instructors to create and manage educational courses while allowing students to enroll, learn, and track their progress. The system supports both reading materials and interactive quizzes with automatic grading, providing a complete e-learning experience.

### 🎯 Key Highlights

- **Role-based Authentication**: Separate interfaces for Instructors and Students
- **Interactive Learning**: Sequential course progression with progress tracking
- **Quiz System**: Automatic grading with 70% pass threshold
- **File Management**: Support for PDF uploads and image processing
- **Responsive Design**: Mobile-first approach with Bootstrap 5
- **Real-time Features**: Live progress tracking and instant feedback

## ✨ Features

### 🔑 User Management & Authentication
- **Role-based Registration**: Choose between Instructor or Student roles
- **Secure Authentication**: JWT-based API authentication + Session-based web auth
- **Profile Management**: Upload profile photos, edit information, change passwords
- **Messaging System**: Internal messaging between users
- **Password Security**: Django's built-in password validation

### 👨‍🏫 Instructor Features
- **Course Creation**: Create courses with title and description
- **Lecture Management**: Add multiple lecture types:
  - **Reading Lectures**: Text content, external URLs, file uploads (PDFs, images)
  - **Quiz Lectures**: Multiple-choice questions with automatic grading
- **Sequential Content**: Lectures are ordered and students must complete them sequentially
- **File Upload Support**: Upload PDFs, images, and other files for lecture content
- **Student Assessment**: View and grade student quiz submissions
- **Course Publishing**: Control course visibility with publish/unpublish feature

### 🎓 Student Features
- **Course Browsing**: View all available courses with search functionality
- **Course Enrollment**: Enroll in courses of interest
- **Lecture Viewing**: Access lectures sequentially with completion tracking
- **Progress Tracking**: Real-time progress tracking (X/Y lectures completed)
- **Quiz System**: 
  - Take multiple-choice quizzes
  - Automatic grading with 70% pass threshold
  - Immediate feedback on results
- **Sequential Learning**: Must complete current lecture to unlock next
- **Search & Discovery**: Search courses by title, description, or instructor

### 🔍 Search & Discovery
- **Course Search**: Search by title, description, or instructor name
- **Filter Options**: Browse courses by categories (placeholder for future enhancement)
- **Real-time Results**: Instant search results with highlighting

### 📱 Responsive Design
- **Mobile-First**: Optimized for mobile devices
- **Tablet Support**: Responsive design for tablets
- **Desktop Experience**: Full-featured desktop interface
- **Dark Mode**: Toggle between light and dark themes
- **Accessibility**: Built-in accessibility features

## 🛠️ Technology Stack

### Backend
- **Python 3.9+**: Core programming language for readability and extensive libraries
- **Django 5.2.5**: Full-featured web framework with ORM, admin, and security
- **Django REST Framework 3.16.1**: Powerful toolkit for building Web APIs
- **Django REST Framework Simple JWT 5.5.1**: JWT authentication for API endpoints
- **SQLite**: Lightweight database for development (easily switchable to PostgreSQL)

### Frontend
- **Bootstrap 5.3.3**: Modern CSS framework for responsive design
- **Bootstrap Icons 1.11.3**: Icon library for consistent visual elements
- **Google Fonts (Inter)**: Typography enhancement for better readability
- **CSS Custom Properties**: Dynamic theming with dark/light mode
- **Server-side rendering**: Django templates for SEO-friendly pages

### Forms & Styling
- **Django Crispy Forms 2.4**: Form rendering library with Bootstrap integration
- **Crispy Bootstrap 5 2025.6**: Bootstrap 5 template pack for forms
- **Pillow 11.3.0**: Python Imaging Library for image processing

### Security & Authentication
- **JWT (JSON Web Tokens)**: Stateless authentication for API endpoints
- **Session Authentication**: Traditional Django session-based auth for web interface
- **CSRF Protection**: Built-in Django CSRF protection for form security
- **Role-based Access Control**: Custom decorators for instructor/student permissions
- **File Validation**: Secure file upload handling with type validation

## 🚀 Installation

### Prerequisites
- Python 3.9 or higher
- pip (Python package installer)
- Git

### Step-by-Step Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/learning-management-system.git
   cd learning-management-system
   ```

2. **Create and activate virtual environment**
   ```bash
   # Create virtual environment
   python -m venv venv
   
   # Activate virtual environment
   # On Windows:
     .\venv\Scripts\activate
   # On macOS/Linux:
     source venv/bin/activate
     ```

3. **Install dependencies**
```bash
pip install -r requirements.txt
```

4. **Navigate to Django project directory**
```bash
   cd lms_backend
   ```

5. **Apply database migrations**
   ```bash
   python manage.py makemigrations
   python manage.py migrate
   ```

6. **Create a superuser (optional)**
```bash
   python manage.py createsuperuser
   ```

7. **Seed the database with sample data (optional)**
```bash
python manage.py seed_data
```

## 🏃‍♂️ Usage

### Running the Application

1. **Start the development server**
   ```bash
   # Make sure you're in the lms_backend directory
   cd lms_backend
   python manage.py runserver
   ```

2. **Access the application**
   - Open your web browser and navigate to: `http://127.0.0.1:8000/` or `http://localhost:8000/`
   - The application will be running and ready to use!

### Sample Data (if seeded)
- **Instructor Account**: `username: instructor1`, `password: testpassword`
- **Student Accounts**: `username: student1`, `password: testpassword` and `username: student2`, `password: testpassword`

### Getting Started

1. **Register an account** with either Instructor or Student role
2. **Login** to access your dashboard
3. **Instructors**: Create courses, add lectures, and manage content
4. **Students**: Browse courses, enroll, and start learning

## 📚 API Documentation

### Authentication Endpoints
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/token/refresh` - Refresh JWT token

### Course Endpoints
- `GET /api/courses` - List published courses
- `POST /api/courses` - Create new course (instructor only)
- `GET /api/courses/:id` - Get course details
- `POST /api/courses/:id/enroll` - Enroll in course (student only)

### Lecture Endpoints
- `GET /api/courses/:id/lectures` - Get course lectures
- `POST /api/lectures/:id/complete` - Mark reading lecture complete
- `POST /api/lectures/:id/submit` - Submit quiz answers

### Profile & Messaging Endpoints
- `GET /api/auth/profile/` - View user profile
- `POST /api/auth/profile/edit/` - Edit profile
- `GET /api/auth/messages/` - View messages
- `POST /api/auth/messages/send/` - Send message

## 🏗️ Project Structure

```
learning-management-system/
├── README.md                 # Project documentation
├── requirements.txt          # Python dependencies
├── .gitignore               # Git ignore rules
└── lms_backend/             # Django project
    ├── manage.py            # Django management script
    ├── lms_project/         # Django project settings
    │   ├── settings.py      # Project configuration
    │   ├── urls.py          # Main URL configuration
    │   └── wsgi.py          # WSGI configuration
    ├── users/               # User management & authentication
    │   ├── models.py        # Custom user model
    │   ├── views.py         # User views and API
    │   ├── forms.py         # User forms
    │   └── urls.py          # User URL patterns
    ├── courses/             # Course management
    │   ├── models.py        # Course model
    │   ├── views.py         # Course views and API
    │   ├── forms.py         # Course forms
    │   └── decorators.py    # Role-based permissions
    ├── lectures/            # Lecture content
    │   ├── models.py        # Lecture models
    │   ├── views.py         # Lecture views and API
    │   └── forms.py         # Lecture forms
    ├── quizzes/             # Quiz system
    │   ├── models.py        # Quiz models
    │   ├── views.py         # Quiz views
    │   └── forms.py         # Quiz forms
    ├── enrollments/         # Student enrollments
    │   ├── models.py        # Enrollment model
    │   └── views.py         # Enrollment views
    ├── progress/            # Progress tracking
    │   └── models.py        # Progress model
    ├── templates/           # HTML templates
    │   ├── base.html        # Base template
    │   ├── users/           # User templates
    │   ├── courses/         # Course templates
    │   ├── lectures/        # Lecture templates
    │   └── quizzes/         # Quiz templates
    ├── static/              # Static assets
    │   └── css/             # CSS files
    │       └── style.css    # Custom styles
    └── media/               # User uploaded files
        ├── profile_photos/  # User profile images
        └── lecture_files/   # Course materials
```

## 🎯 Key Design Decisions

### Why Django?
- **Rapid Development**: Django's "batteries-included" approach speeds up development
- **Admin Interface**: Built-in admin panel for content management
- **Security**: Django's security features protect against common web vulnerabilities
- **Scalability**: Django can handle high-traffic applications with proper optimization
- **Community**: Large, active community with extensive documentation

### Why Bootstrap 5?
- **Mobile-First**: Responsive design that works on all devices
- **Consistency**: Pre-built components ensure consistent UI/UX
- **Accessibility**: Built-in accessibility features
- **Customization**: Easy to customize with CSS variables
- **Performance**: Lightweight and fast-loading

### Why SQLite for Development?
- **Simplicity**: No server setup required
- **Portability**: Database file can be easily shared and backed up
- **Performance**: Fast for development and small to medium applications
- **Django Integration**: Seamless integration with Django ORM

## 🔧 Development Features

### Code Quality
- **Modular Structure**: Each feature is a separate Django app
- **Clean Code**: Well-documented functions and classes
- **Type Hints**: Python type hints for better code clarity
- **Error Handling**: Comprehensive error handling with user-friendly messages

### Security Features
- **Authentication**: Multi-layered authentication system
- **Authorization**: Role-based access control throughout the application
- **Input Validation**: Form validation and sanitization
- **File Upload Security**: Secure file handling with type validation

### Performance Optimizations
- **Database Queries**: Optimized queries with select_related and prefetch_related
- **Static Files**: Proper static file serving and caching
- **Template Optimization**: Efficient template rendering
- **API Response**: Optimized API responses with proper serialization

## 🚀 Deployment Considerations

### Production Setup
1. **Database**: Switch to PostgreSQL for production
2. **Static Files**: Configure static file serving (nginx/Apache)
3. **Media Files**: Set up cloud storage (AWS S3, Google Cloud Storage)
4. **Environment Variables**: Secure configuration management
5. **SSL Certificate**: HTTPS for security
6. **Backup Strategy**: Regular database and file backups

### Environment Variables
```bash
SECRET_KEY=your-secret-key-here
DEBUG=False
ALLOWED_HOSTS=your-domain.com
DATABASE_URL=postgresql://user:password@localhost/dbname
```

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit your changes** (`git commit -m 'Add some amazing feature'`)
4. **Push to the branch** (`git push origin feature/amazing-feature`)
5. **Open a Pull Request**

### Development Guidelines
- Follow PEP 8 style guidelines
- Add tests for new features
- Update documentation as needed
- Ensure all tests pass before submitting

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Check the documentation
- Review the code comments

## 🙏 Acknowledgments

- Django community for the excellent framework
- Bootstrap team for the responsive CSS framework
- All contributors and users of this project

---

**Built with ❤️ using Django and Bootstrap 5**

*This Learning Management System demonstrates modern web development practices with a focus on user experience, security, and scalability.*

---

**⭐ Star this repository if you find it helpful!**
