# Enterprise DevSecOps Pipeline: Automated Infrastructure Audit

## 📌 Project Overview
This project demonstrates a fully automated DevSecOps CI/CD pipeline using GitHub Actions. The objective was to enforce "Shift-Left" security principles by integrating **Checkov** (a static code analysis tool) directly into the deployment workflow. This ensures that any infrastructure-as-code (IaC) misconfigurations are caught and blocked before being deployed to the cloud environment.

## 🛠️ Tech Stack
* **Infrastructure as Code (IaC):** Terraform
* **Containerization:** Docker
* **Scripting:** Python
* **Security & Auditing:** Checkov
* **CI/CD Automation:** GitHub Actions, Ubuntu Cloud Runners

---

## 🚀 The Pipeline Lifecycle

### 1. Identifying the Vulnerability (Local Testing)
Initially, the infrastructure contained critical security flaws, including publicly accessible S3 buckets and unencrypted data streams. Running a local Checkov scan immediately flagged these vulnerabilities.

<img width="709" height="456" alt="1" src="https://github.com/user-attachments/assets/f5e07993-5c93-4377-a468-0f4c8faa22d3" />


### 2. The Remediation
To secure the infrastructure, the Terraform configurations were refactored to enforce strict enterprise standards, including AES-256 encryption and mandatory versioning. The subsequent local scan passed the critical requirements.

<img width="682" height="443" alt="2" src="https://github.com/user-attachments/assets/5ddeb4f1-e436-45df-8992-b40ca54a42b3" />


### 3. CI/CD Integration
With the local environment secured, a GitHub Actions workflow (`security-scan.yml`) was engineered to automate this auditing process in the cloud. 

<img width="670" height="356" alt="3" src="https://github.com/user-attachments/assets/5c163c1f-0618-4a8d-9efb-0630e277d2d0" />


The code was version-controlled and pushed to the remote repository.

<img width="702" height="256" alt="4" src="https://github.com/user-attachments/assets/59dd2434-e4a1-48c1-866b-a1afc220245f" />


### 4. The Automated Gatekeeper (Cloud Execution)
The defining success of this pipeline is its strict enforcement. Upon pushing the code, the GitHub Actions cloud server automatically triggered the Checkov scan. While the critical encryption vulnerabilities were fixed, Checkov successfully detected missing low-risk enterprise configurations (like cross-region replication) and **blocked the deployment**. 

<img width="810" height="437" alt="5" src="https://github.com/user-attachments/assets/e4a7dcee-0eac-426f-a2d4-26052f34277c" />


**Conclusion:** A "failed" pipeline in this context is a DevSecOps victory. It proves the automated security gatekeeper is fully functional, preventing unauthorized or under-configured infrastructure from reaching production.
