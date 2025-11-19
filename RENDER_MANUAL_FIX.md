# 🔧 Fix Render Deployment - Manual Service Update

## Problem
Your service was created **manually** instead of using Blueprint, so Render is:
- Using default build command (`pip install -r requirements.txt`) instead of `build.sh`
- Using default start command (`gunicorn app:app`) instead of Django command

## Solution: Update Settings in Render Dashboard

### Step 1: Update Build Command

1. Go to **Render Dashboard**: https://dashboard.render.com
2. Click on your **web service** (`lms-backend`)
3. Go to **"Settings"** tab
4. Scroll to **"Build Command"** section
5. **Replace** the current command with:
   ```
   chmod +x build.sh && ./build.sh
   ```
6. Click **"Save Changes"**

### Step 2: Update Start Command

1. Still in **"Settings"** tab
2. Scroll to **"Start Command"** section
3. **Replace** `gunicorn app:app` with:
   ```
   cd lms_backend && gunicorn lms_project.wsgi:application
   ```
4. Click **"Save Changes"**

### Step 3: Verify Environment Variables

Make sure these are set in **"Environment"** tab:

- `PYTHON_VERSION` = `3.12.4`
- `DJANGO_SETTINGS_MODULE` = `lms_project.settings_production`
- `SECRET_KEY` = (should be auto-generated or set manually)
- `DEBUG` = `False`
- `ALLOWED_HOSTS` = `your-app-name.onrender.com` (update with your actual URL)
- `DATABASE_URL` = (should be set if database is linked)

### Step 4: Manual Deploy

1. Go to **"Manual Deploy"** section
2. Click **"Deploy latest commit"**
3. Wait for build and deployment to complete

## Alternative: Use Blueprint (Recommended)

If you want to use the `render.yaml` file properly:

1. **Delete** the current web service
2. Go to **"New +"** → **"Blueprint"**
3. Connect your GitHub repository: `MilindKashyap/Mini-LMS-PUBLISHED`
4. Render will auto-detect `render.yaml`
5. Click **"Apply"**

This will automatically:
- Use the correct build command from `render.yaml`
- Use the correct start command from `render.yaml`
- Create the database
- Link everything together
- Set all environment variables

## What Each Command Does

### Build Command:
```bash
chmod +x build.sh && ./build.sh
```
- Makes build.sh executable
- Runs build.sh which:
  - Installs dependencies
  - Collects static files
  - Runs database migrations

### Start Command:
```bash
cd lms_backend && gunicorn lms_project.wsgi:application
```
- Changes to Django project directory
- Starts Gunicorn with Django WSGI application

## After Fix

Once updated, your deployment should:
✅ Build successfully with static files collected
✅ Run database migrations
✅ Start Gunicorn with correct Django application
✅ Connect to PostgreSQL database
✅ Serve the application correctly

