#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
pip install -r requirements.txt

# Set Django settings module for production
export DJANGO_SETTINGS_MODULE=lms_project.settings_production

# Collect static files
cd lms_backend
python manage.py collectstatic --no-input

# Run migrations
python manage.py migrate
