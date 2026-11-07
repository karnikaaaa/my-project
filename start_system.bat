@echo off
echo ========================================================
echo   BIO-CRYPT : AI-Based Fake Identity Screening System
echo   Smart India Hackathon 2026 - Defense & Immigration
echo ========================================================
echo.

echo [1/2] Starting FastAPI Backend on http://127.0.0.1:8000...
start cmd /k "cd backend && python -m uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload"

echo [2/2] Starting Vite React Frontend on http://localhost:5173...
start cmd /k "cd frontend && npm run dev"

echo.
echo ========================================================
echo   BIO-CRYPT services are launching!
echo   Frontend : http://localhost:5173
echo   Backend  : http://127.0.0.1:8000
echo   Swagger  : http://127.0.0.1:8000/docs
echo ========================================================
pause
