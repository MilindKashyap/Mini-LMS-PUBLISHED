# 🚀 Deployment Guide for Render

This guide will help you deploy the Learning Management System to Render.

## 📋 Prerequisites

1. A GitHub account
2. A Render account (sign up at https://render.com)
3. Your code pushed to a GitHub repository

## 🔧 Step-by-Step Deployment

### 1. Prepare Your Repository

Make sure all files are committed and pushed to GitHub:
- `render.yaml` - Render configuration
- `Procfile` - Process file for gunicorn
- `build.sh` - Build script
- `requirements.txt` - Python dependencies
- `lms_backend/` - Django project directory

### 2. Deploy Using Render Dashboard

#### Option A: Using render.yaml (Recommended)

1. **Go to Render Dashboard**: https://dashboard.render.com
2. **Click "New +"** → **"Blueprint"**
3. **Connect your GitHub repository**
4. **Render will automatically detect `render.yaml`**
5. **Click "Apply"** to deploy

The `render.yaml` file will automatically:
- Create a PostgreSQL database
- Create a web service
- Link them together
- Set up environment variables

#### Option B: Manual Setup

1. **Create PostgreSQL Database**:
   - Go to Render Dashboard
   - Click "New +" → "PostgreSQL"
   - Name it: `lms-database`
   - Plan: Free
   - Click "Create Database"
   - Copy the **Internal Database URL**

2. **Create Web Service**:
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Use these settings:
     - **Name**: `lms-backend`
     - **Environment**: `Python 3`
     - **Build Command**: `chmod +x build.sh && ./build.sh`
     - **Start Command**: `cd lms_backend && gunicorn lms_project.wsgi:application`
     - **Plan**: Free

3. **Set Environment Variables**:
   - `PYTHON_VERSION` = `3.12.4`
   - `DJANGO_SETTINGS_MODULE` = `lms_project.settings_production`
   - `SECRET_KEY` = (Generate a secure random key)
   - `DEBUG` = `False`
   - `ALLOWED_HOSTS` = `your-app-name.onrender.com`
   - `DATABASE_URL` = (Internal Database URL from step 1)

### 3. Generate Secret Key

You can generate a Django secret key using:
```python
python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

Or use an online generator: https://djecrety.ir/

### 4. Update ALLOWED_HOSTS

After deployment, update `ALLOWED_HOSTS` in Render environment variables with your actual Render URL:
- Format: `your-app-name.onrender.com`

### 5. Run Initial Setup (Optional)

After first deployment, you may want to:
1. Create a superuser:
   - Use Render's Shell feature
   - Run: `cd lms_backend && python manage.py createsuperuser`

2. Seed sample data (optional):
   - Run: `cd lms_backend && python manage.py seed_data`

## 🔐 Environment Variables Reference

Here are the environment variables you need to set in Render:

```bash
# Required
SECRET_KEY=your-generated-secret-key-here
DEBUG=False
ALLOWED_HOSTS=your-app-name.onrender.com
DJANGO_SETTINGS_MODULE=lms_project.settings_production
DATABASE_URL=postgresql://... (automatically set if using render.yaml)

# Optional
PYTHON_VERSION=3.12.4
```

## 📝 Important Notes

1. **Static Files**: WhiteNoise is configured to serve static files automatically
2. **Media Files**: Media files (uploads) are stored locally. For production, consider using:
   - AWS S3
   - Cloudinary
   - Other cloud storage services

3. **Database**: The free PostgreSQL plan has limitations:
   - 90 days of inactivity will pause the database
   - Limited storage (1 GB)
   - For production, consider upgrading

4. **Web Service**: The free plan:
   - Spins down after 15 minutes of inactivity
   - Limited to 750 hours/month
   - For production, consider upgrading

## 🐛 Troubleshooting

### Build Fails
- Check that `build.sh` has execute permissions
- Verify all dependencies in `requirements.txt`
- Check Python version compatibility

### Database Connection Issues
- Verify `DATABASE_URL` is set correctly
- Check database is running
- Ensure database credentials are correct

### Static Files Not Loading
- Verify `collectstatic` ran successfully in build
- Check WhiteNoise middleware is enabled
- Verify `STATIC_ROOT` is set correctly

### 500 Internal Server Error
- Check Render logs for detailed error messages
- Verify `SECRET_KEY` is set
- Check `ALLOWED_HOSTS` includes your domain
- Ensure database migrations ran successfully

## 🔄 Updating Your Deployment

1. Push changes to your GitHub repository
2. Render will automatically detect and redeploy
3. Or manually trigger a deploy from Render dashboard

## 📚 Additional Resources

- [Render Documentation](https://render.com/docs)
- [Django Deployment Checklist](https://docs.djangoproject.com/en/stable/howto/deployment/checklist/)
- [WhiteNoise Documentation](https://whitenoise.readthedocs.io/)

## ✅ Post-Deployment Checklist

- [ ] Application is accessible via Render URL
- [ ] Database migrations completed successfully
- [ ] Static files are loading correctly
- [ ] Can create superuser account
- [ ] Can register new users
- [ ] Can create courses (as instructor)
- [ ] Can enroll in courses (as student)
- [ ] Media file uploads work (if applicable)

---

**Need Help?** Check the Render logs or Django logs for detailed error messages.

