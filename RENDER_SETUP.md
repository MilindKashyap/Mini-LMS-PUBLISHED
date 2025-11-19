# 🚀 Quick Render Deployment Guide

## Quick Start

1. **Push your code to GitHub**

2. **Go to Render Dashboard**: https://dashboard.render.com

3. **Deploy using Blueprint**:
   - Click "New +" → "Blueprint"
   - Connect your GitHub repository
   - Render will auto-detect `render.yaml`
   - Click "Apply"

4. **After deployment, update ALLOWED_HOSTS**:
   - Go to your web service settings
   - Find the environment variable `ALLOWED_HOSTS`
   - Update it with your actual Render URL (e.g., `your-app-name.onrender.com`)

## Generate Secret Key

Run this command locally to generate a secure secret key:

```bash
python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

Then update the `SECRET_KEY` environment variable in Render dashboard.

## Environment Variables Checklist

Make sure these are set in Render:

- ✅ `SECRET_KEY` - Generated secret key
- ✅ `DEBUG` - Set to `False`
- ✅ `ALLOWED_HOSTS` - Your Render app URL
- ✅ `DJANGO_SETTINGS_MODULE` - `lms_project.settings_production`
- ✅ `DATABASE_URL` - Automatically set by Render (if using render.yaml)
- ✅ `PYTHON_VERSION` - `3.12.4`

## First-Time Setup Commands

After deployment, use Render's Shell feature to:

1. **Create superuser**:
   ```bash
   cd lms_backend
   python manage.py createsuperuser
   ```

2. **Seed sample data** (optional):
   ```bash
   python manage.py seed_data
   ```

## Important Notes

- ⚠️ Free tier services spin down after inactivity
- ⚠️ Update `ALLOWED_HOSTS` with your actual Render URL
- ⚠️ Media files are stored locally (consider cloud storage for production)
- ⚠️ Database backups are recommended for production

## Troubleshooting

- **Build fails**: Check build logs in Render dashboard
- **500 errors**: Check application logs, verify environment variables
- **Static files not loading**: Verify `collectstatic` ran in build
- **Database errors**: Check database connection string

For detailed information, see `DEPLOYMENT.md`

