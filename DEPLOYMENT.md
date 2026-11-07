# BIO-CRYPT Deployment Guide
**Smart India Hackathon 2026 • AI Identity Screening System**

This guide provides step-by-step instructions for deploying BIO-CRYPT across various environments, from single-command Docker containers to enterprise cloud hosting platforms (Render, Railway, AWS, DigitalOcean, or VPS).

---

## Architecture Overview

BIO-CRYPT is configured for **Unified Production Serving**:
- The React frontend is compiled to high-performance static bundles (`frontend/dist`).
- The FastAPI backend directly serves the compiled frontend assets alongside its REST API on port `8000` (or the dynamic `$PORT` provided by your cloud provider).
- **Result:** You can deploy the entire application as **one single service** with zero CORS configuration hassles and minimal hosting cost.

---

## Method 1: Docker / Docker Compose Deployment (Recommended)

### Prerequisites
- Docker Engine & Docker Compose installed.

### 1-Command Deployment:
```bash
docker compose up --build -d
```

### Verification:
- Application UI: `http://localhost:8000`
- API Documentation: `http://localhost:8000/docs`
- Health check: `http://localhost:8000/health`

### Stop:
```bash
docker compose down
```

---

## Method 2: Render.com Deployment (Free / Low-Cost Cloud)

Render allows you to deploy Docker containers directly from GitHub.

1. Push this folder to a GitHub repository:
   ```bash
   git init
   git add .
   git commit -m "Deploy BIO-CRYPT"
   git remote add origin https://github.com/your-username/bio-crypt.git
   git push -u origin main
   ```
2. Log in to [Render.com](https://render.com) and click **New +** &rarr; **Web Service**.
3. Select your repository.
4. Choose **Docker** as the Runtime environment.
5. In **Environment Variables**, add:
   - `SECRET_KEY`: `your-random-production-secret-key-32-chars`
   - `DATABASE_URL`: *(Leave blank for SQLite, or attach a free Render PostgreSQL database URL)*
6. Click **Create Web Service**. Render will automatically build the multi-stage Docker container and deploy the app at `https://your-app-name.onrender.com`.

---

## Method 3: Railway.app Deployment

1. Install the Railway CLI or use the web dashboard at [Railway.app](https://railway.app).
2. Click **New Project** &rarr; **Deploy from GitHub repo**.
3. Railway will automatically detect the `Dockerfile` in the root directory.
4. Add the environment variables (`SECRET_KEY`, `ACCESS_TOKEN_EXPIRE_MINUTES`).
5. Railway will provision a public HTTPS domain.

---

## Method 4: Traditional Linux VPS / Ubuntu Deployment

### 1. System Dependencies:
```bash
sudo apt update && sudo apt install -y python3-pip python3-venv nodejs npm libgl1 libglib2.0-0 nginx
```

### 2. Build the Frontend:
```bash
cd bio-crypt/frontend
npm install
npm run build
```

### 3. Setup Python Backend:
```bash
cd ../backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 4. Create a Systemd Service (`/etc/systemd/system/biocrypt.service`):
```ini
[Unit]
Description=BIO-CRYPT Border Screening Service
After=network.target

[Service]
User=ubuntu
WorkingDirectory=/path/to/bio-crypt/backend
ExecStart=/path/to/bio-crypt/backend/venv/bin/uvicorn app.main:app --host 127.0.0.1 --port 8000
Restart=always

[Install]
WantedBy=multi-user.target
```

```bash
sudo systemctl daemon-reload
sudo systemctl enable biocrypt
sudo systemctl start biocrypt
```

### 5. Nginx Reverse Proxy Configuration (`/etc/nginx/sites-available/biocrypt`):
```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

```bash
sudo ln -s /etc/nginx/sites-available/biocrypt /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl restart nginx
```

---

## Demonstration Credentials in Production

Default seeded users generated on startup:
- **Officer Username:** `officer_sharma`
- **Passcode:** `DefensePass#2026`
- **Admin Username:** `admin_director`
- **Passcode:** `AdminPass#2026`

To change default admin credentials, update them directly in `backend/app/services/auth_service.py` or register a new administrator account.
