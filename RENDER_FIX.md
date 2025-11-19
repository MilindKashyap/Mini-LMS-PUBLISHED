# 🔧 Render Deployment Fix

## Issue
Render is trying to run `gunicorn app:app` instead of the correct Django command.

## Solution

If you created the service **manually** (not via Blueprint), you need to update the start command in Render dashboard:

### Steps to Fix:

1. **Go to your Render Dashboard**
2. **Click on your web service** (`lms-backend`)
3. **Go to "Settings" tab**
4. **Find "Start Command" section**
5. **Update it to:**
   ```
   cd lms_backend && gunicorn lms_project.wsgi:application
   ```
6. **Save changes**
7. **Manual Deploy** → The service will restart with the correct command

### Alternative: Use Blueprint (Recommended)

1. **Delete the current service** (if created manually)
2. **Go to Render Dashboard**
3. **Click "New +" → "Blueprint"**
4. **Connect your GitHub repository**: `MilindKashyap/Mini-LMS-PUBLISHED`
5. **Render will auto-detect `render.yaml`**
6. **Click "Apply"**

The Blueprint will automatically:
- Use the correct start command from `render.yaml`
- Create the database
- Link everything together
- Set environment variables

### Verify Configuration

Make sure these files are correct:

1. **Procfile** (should contain):
   ```
   web: cd lms_backend && gunicorn lms_project.wsgi:application
   ```

2. **render.yaml** (startCommand should be):
   ```yaml
   startCommand: cd lms_backend && gunicorn lms_project.wsgi:application
   ```

3. **build.sh** should:
   - Install dependencies
   - Collect static files
   - Run migrations

### After Fix

Once the start command is correct, the deployment should work. The application will:
- Start gunicorn server
- Load Django WSGI application
- Connect to PostgreSQL database
- Serve static files via WhiteNoise

