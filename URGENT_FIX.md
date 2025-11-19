# 🚨 URGENT: Fix Render Start Command

## The Problem
Render is still running: `gunicorn app:app` ❌
It should run: `cd lms_backend && gunicorn lms_project.wsgi:application` ✅

## ⚡ Quick Fix (2 Minutes)

### Step-by-Step Instructions:

1. **Open Render Dashboard**
   - Go to: https://dashboard.render.com
   - Sign in if needed

2. **Find Your Service**
   - Look for service named: `lms-backend` (or whatever you named it)
   - Click on it

3. **Go to Settings**
   - Click on **"Settings"** tab (top menu)
   - Scroll down to find **"Start Command"** section

4. **Update Start Command**
   - Find the field that says: `gunicorn app:app`
   - **DELETE** that text
   - **TYPE** this exactly:
     ```
     cd lms_backend && gunicorn lms_project.wsgi:application
     ```
   - Make sure there are no extra spaces or typos

5. **Save Changes**
   - Click **"Save Changes"** button (usually at bottom of page)
   - Wait for confirmation

6. **Deploy**
   - Go to **"Manual Deploy"** section (in the same Settings page or separate tab)
   - Click **"Deploy latest commit"** or **"Deploy"** button
   - Wait for deployment to complete

## ✅ Verification

After deployment, check the logs. You should see:
- ✅ `Running 'cd lms_backend && gunicorn lms_project.wsgi:application'`
- ❌ NOT `Running 'gunicorn app:app'`

## 📸 Visual Guide

```
Render Dashboard
  └── Your Service (lms-backend)
      └── Settings Tab
          └── Start Command Section
              └── [Current: gunicorn app:app]  ← DELETE THIS
              └── [New: cd lms_backend && gunicorn lms_project.wsgi:application]  ← TYPE THIS
              └── [Save Changes]  ← CLICK THIS
```

## 🔍 Still Not Working?

If you can't find the Start Command field:

1. Make sure you're in the **Settings** tab
2. Scroll down - it might be below other settings
3. Look for "Start Command" or "Command" field
4. If still not found, the service might be using Blueprint - check if `render.yaml` is being used

## 🆘 Alternative: Delete and Recreate

If updating doesn't work:

1. **Delete** the current service
2. Click **"New +"** → **"Blueprint"**
3. Connect GitHub repo: `MilindKashyap/Mini-LMS-PUBLISHED`
4. Click **"Apply"**
5. This will use `render.yaml` automatically

---

**The start command MUST be updated in Render dashboard for the deployment to work!**

