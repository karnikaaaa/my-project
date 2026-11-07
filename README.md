# BIO-CRYPT – AI-Based Fake Identity & Document Screening System

> **"Defending Borders with Cryptographic Certainty."**  
> *Developed for Smart India Hackathon 2026 • Ministry of Home Affairs / Border Security Division*

---

## 1. Project Overview

**BIO-CRYPT** is a government-grade, multi-vector identity verification and document fraud detection platform designed for international airports, border checkpoints, and immigration control facilities. 

The system mitigates forged identity documents, digitally manipulated photos, fraudulent Machine Readable Zones (MRZ), and biometric impersonation through an intelligent, multi-layered AI verification pipeline:

1. **Module 1: Document OCR & MRZ Verification (ICAO Doc 9303 Standards)**  
   Extracts identity credentials, parses TD1/TD2/TD3 Machine Readable Zones, and mathematically computes 7-3-1 weighted check digits, dates of birth/expiry checksums, and composite integrity hashes.
2. **Module 2: AI Document Forgery Detection (CNN & Error Level Analysis)**  
   Analyzes pixel compression layers and sensor noise using Error Level Analysis (ELA) and convolutional forensic feature extraction to expose image splicing, digital tampering, and recompression artifacts.
3. **Module 3: Biometric Identity Verification (1:1 Siamese Facial Matching)**  
   Performs 1:1 facial similarity comparison between document portrait photographs and live traveler webcam selfies using 128-dimensional spatial-frequency Siamese feature embeddings and cosine similarity metrics.
4. **Centralized AI Risk Scoring Engine**  
   Aggregates results into a 0–100 composite risk index (**LOW RISK: 0–30**, **MEDIUM RISK: 31–60**, **HIGH RISK: 61–100**) with explainable algorithmic rationale and recommended operational actions.
5. **Cryptographic SHA-256 Chained Audit Trail & Interpol SLTD Integration**  
   Ensures tamper-evident audit logging through block-chained SHA-256 hashes and provides an API-ready gateway to cross-check Interpol's Stolen and Lost Travel Documents (SLTD) database.

---

## 2. Technology Stack

### Frontend
- **React.js 19** with Vite 8
- **Tailwind CSS v4** with glassmorphism & dark defense command center theme
- **Lucide React** icons
- **React Router Dom v7**

### Backend
- **Python 3.10+ / Python 3.14**
- **FastAPI** (Asynchronous REST API framework)
- **Pydantic v2** (Strict data validation and response schemas)
- **SQLAlchemy 2.0** ORM (PostgreSQL & SQLite compatible)
- **Uvicorn** (ASGI server)
- **ReportLab** (Official PDF report generation engine)

### AI / ML & Forensic Algorithms
- **ICAO Doc 9303 Part 3–7** Check Digit & MRZ Parser (TD1, TD2, TD3 formats)
- **Error Level Analysis (ELA)** compression delta engine & localized contour anomaly mapper
- **Convolutional Forensic Pipeline** (Laplacian variance, high-frequency noise std dev, and edge gradient moment analysis)
- **Siamese Neural Network Pipeline** (128-D affine-normalized facial embeddings & cosine similarity matching)
- **EasyOCR** optical character recognition integration

### Database & Security
- **PostgreSQL / Local Encrypted SQLite** (Plug-and-play local development and PostgreSQL production deployment via `DATABASE_URL`)
- **JWT (JSON Web Tokens)** with HS256 / AES-256 local architecture
- **Bcrypt** salted password hashing
- **Cryptographic SHA-256 chained audit ledger**

---

## 3. Demonstration Accounts & Login Credentials

| Role | Username | Email | Security Passcode | Assigned Station |
| :--- | :--- | :--- | :--- | :--- |
| **Verification Officer** | `officer_sharma` | `officer@biocrypt.gov.in` | `DefensePass#2026` | IGI Airport - Terminal 3 Checkpoint |
| **Command Administrator** | `admin_director` | `admin@biocrypt.gov.in` | `AdminPass#2026` | Border Command Headquarters |

*(Note: Quick 1-click credential fill buttons are provided directly on the login screen for seamless jury evaluation).*

---

## 4. Test Case Presets for Hackathon Jury

The top banner of the application features **One-Click Test Presets** to demonstrate all threat scenarios instantly:

1. **Test 1: Genuine Indian Passport (Mr. Rajesh Kumar Sharma)**
   - *Status:* Genuine TD3 Passport (`Z1234567`), 100% valid ICAO checksums, uniform ELA compression layers, matching live selfie.
   - *Result:* **LOW RISK (16.5 / 100)** &rarr; *Recommended for normal processing*.
2. **Test 2: Spliced Document Forgery (Mr. Farhan Khan)**
   - *Status:* Digitally altered surname, spliced portrait photo, invalid ICAO composite check digits, severe ELA compression discrepancy.
   - *Result:* **HIGH RISK (84.0 / 100)** &rarr; *Flag for mandatory human review*.
3. **Test 3: Interpol Stolen Passport Watchlist (Mr. Anil Kumar Verma)**
   - *Status:* Passport ID `A9988776` flagged as stolen in Interpol SLTD database (Ref: `INTERPOL-SLTD-2024-9988776-IN`).
   - *Result:* **HIGH RISK (92.0 / 100)** &rarr; *Immediate border escalation*.

---

## 5. Project Directory Structure

```
bio-crypt/
├── backend/
│   ├── app/
│   │   ├── ai_models/
│   │   │   ├── mrz_parser.py          # ICAO Doc 9303 TD1/TD2/TD3 check digit engine
│   │   │   ├── forensics_cnn.py       # ELA & CNN image tampering analyzer
│   │   │   └── siamese_face.py        # 128-D Siamese face similarity matcher
│   │   ├── models/                    # SQLAlchemy database models
│   │   │   ├── user.py                # Users & officers
│   │   │   ├── verification.py        # Records, OCR, Forensics, Biometrics, Risk
│   │   │   └── audit.py               # Cryptographic SHA-256 chained audit logs
│   │   ├── routers/                   # FastAPI API endpoint modules
│   │   │   ├── auth.py                # JWT authentication & registration
│   │   │   ├── ocr.py                 # Module 1 endpoints
│   │   │   ├── forensics.py           # Module 2 endpoints
│   │   │   ├── biometrics.py          # Module 3 endpoints
│   │   │   ├── risk.py                # Risk scoring & Interpol check
│   │   │   ├── reports.py             # Reports & PDF streaming
│   │   │   └── dashboard.py           # Metrics & synthetic sample serving
│   │   ├── schemas/                   # Pydantic request/response schemas
│   │   ├── services/                  # Business logic & algorithms
│   │   │   ├── auth_service.py
│   │   │   ├── ocr_service.py
│   │   │   ├── risk_engine.py
│   │   │   ├── pdf_service.py
│   │   │   └── audit_service.py
│   │   ├── sample_data/               # Pre-compiled synthetic passport & selfie images
│   │   ├── config.py                  # Environment settings & secrets
│   │   ├── database.py                # DB engine & session
│   │   └── main.py                    # FastAPI application root & middleware
│   ├── test_api_e2e.py                # End-to-end automated test suite
│   └── requirements.txt
├── frontend/
│   ├── src/
│   │   ├── components/                # Modular UI components
│   │   │   ├── Navbar.jsx
│   │   │   ├── Sidebar.jsx
│   │   │   ├── SampleDataSelector.jsx
│   │   │   └── InterpolCheckModal.jsx
│   │   ├── context/                   # Global React state
│   │   │   ├── AuthContext.jsx
│   │   │   └── VerificationContext.jsx
│   │   ├── pages/                     # Full-featured application views
│   │   │   ├── Login.jsx
│   │   │   ├── Dashboard.jsx
│   │   │   ├── OCRVerification.jsx
│   │   │   ├── ForensicsVerification.jsx
│   │   │   ├── BiometricVerification.jsx
│   │   │   ├── RiskAssessment.jsx
│   │   │   ├── FinalReport.jsx
│   │   │   ├── VerificationHistory.jsx
│   │   │   └── AuditLogs.jsx
│   │   ├── services/
│   │   │   └── api.js                 # Frontend API client
│   │   ├── App.jsx                    # Router & protected layouts
│   │   ├── index.css                  # Cyber-defense custom styling
│   │   └── main.jsx
│   ├── package.json
│   └── vite.config.js
└── README.md
```

---

## 6. Installation & Setup Instructions

### Prerequisites
- **Python 3.10+** (Python 3.11, 3.12, 3.13, 3.14 verified)
- **Node.js 18+** & **npm**

---

### Step 1: Backend Setup

1. Open a terminal and navigate to the backend directory:
   ```bash
   cd bio-crypt/backend
   ```

2. (Optional) Create and activate a Python virtual environment:
   ```bash
   python -m venv venv
   # Windows:
   venv\Scripts\activate
   # Linux/macOS:
   source venv/bin/activate
   ```

3. Install backend dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. (Optional) Run the automated 10-point end-to-end test suite:
   ```bash
   python test_api_e2e.py
   ```

5. Launch the FastAPI backend server:
   ```bash
   uvicorn app.main:app --host 127.0.0.1 --port 8000 --reload
   ```

The backend will start at `http://127.0.0.1:8000`.  
Interactive Swagger API documentation is available at `http://127.0.0.1:8000/docs`.

---

### Step 2: Frontend Setup

1. Open a new terminal and navigate to the frontend directory:
   ```bash
   cd bio-crypt/frontend
   ```

2. Install frontend dependencies:
   ```bash
   npm install
   ```

3. Launch the Vite development server:
   ```bash
   npm run dev
   ```

The frontend will be live at `http://localhost:5173`.

---

### Step 3: PostgreSQL Configuration (Production Mode)

By default, BIO-CRYPT runs out-of-the-box using local SQLite with zero external database installation required. To switch to PostgreSQL in production:

1. Create a PostgreSQL database:
   ```sql
   CREATE DATABASE biocrypt;
   ```

2. Set the `DATABASE_URL` environment variable:
   ```bash
   # Windows PowerShell
   $env:DATABASE_URL="postgresql://postgres:password@localhost:5432/biocrypt"

   # Linux/macOS
   export DATABASE_URL="postgresql://postgres:password@localhost:5432/biocrypt"
   ```

3. Start the FastAPI server; SQLAlchemy will automatically create all tables and seed default demonstration accounts.

---

## 7. REST API Documentation

### Authentication
- `POST /auth/login` – Authenticate with officer username/passcode; returns JWT Bearer token and user profile.
- `POST /auth/register` – Register new officer account with badge number and assigned checkpoint.
- `GET /auth/me` – Retrieve profile and clearance details of the currently authenticated officer.

### Module 1: Document OCR & MRZ
- `POST /api/ocr/analyze` – Multipart upload of document image; returns extracted fields, ICAO Doc 9303 check digit breakdown, and validation status (`Valid`, `Suspicious`, `Invalid`, `Unable to Verify`).

### Module 2: Image Forensics / CNN
- `POST /api/forensics/analyze` – Uploads document image for Error Level Analysis (ELA) and CNN feature inspection; returns manipulation confidence percentage (0–100%), ELA visualization image (base64), and anomaly bounding box heatmap.

### Module 3: Biometric Verification
- `POST /api/biometrics/verify` – Compares live selfie portrait against credential photo; returns 1:1 Siamese cosine similarity percentage, cosine distance, and match verdict (`Strong Match`, `Possible Match`, `Mismatch`, `Unable to Verify`).

### AI Risk Scoring Engine & Interpol
- `POST /api/risk/calculate` – Computes multi-vector composite risk score (0–100), category, anomaly ledger, and recommended action.
- `GET /api/risk/interpol/{doc_number}` – Queries simulated Interpol Stolen and Lost Travel Documents (SLTD) registry.

### Reports & Auditing
- `GET /api/reports` – List all verification records with filter by risk level.
- `GET /api/reports/{id}` – Retrieve comprehensive multi-vector verification record details.
- `GET /api/reports/{id}/pdf` – Generates and streams official defense-grade intelligence PDF report.
- `GET /api/reports/audit/trail` – Retrieve SHA-256 cryptographically chained audit log ledger.
- `POST /api/reports/audit/verify` – Validates cryptographic integrity of the entire audit hash chain.

---

## 8. Ethical AI Governance & Statutory Compliance

1. **Mandatory Human Decision Framework**:  
   Under SIH 2026 and international immigration guidelines, **the AI engine never independently declares a person guilty of identity fraud or rejects a traveller**. The system provides advisory threat assessments; final clearance or secondary inspection authority strictly rests with the designated human officer.
2. **DPDP Act & Biometric Privacy**:  
   Biometric facial embeddings are computed transiently in memory as 128-dimensional mathematical feature vectors. Raw biometric images are never permanently retained or shared.
3. **Explainable AI (XAI)**:  
   Every risk score is accompanied by a transparent algorithmic rationale explaining exactly why each point of risk was assigned.

---

*BIO-CRYPT – Built with precision for Smart India Hackathon 2026.*
