# RESEARCH
- Docker Desktop - https://docs.docker.com/desktop/
- Docker Python guide - https://docs.docker.com/language/python/
- Docker Python image - https://hub.docker.com/_/python
- Dockerfile reference - https://docs.docker.com/engine/reference/builder/
- Docker compose secrets reference - https://docs.docker.com/compose/use-secrets/
- requests 2.31.0 - https://pypi.org/project/requests/
- SOC 2 AICPA reference - https://us.aicpa.org/content/dam/aicpa/interestareas/frc/assuranceadvisoryservices/downloadabledocuments/soc2_csa_ccm_report.pdf

# PROCESS
- Created ThousandEyes trial account and sample tests
- Created and validated Python script to print /tests API response
- Installed Docker Desktop
- Used docker init to create recommended Docker assets
- Edited Dockerfile for specific purpose
- Created secret_user.txt and secret_token.txt files with ThousandEyes API user account and token for authentication
- Added .gitignore and .dockerignore entries for the secret files
- Created compose.yaml for secrets management
- Ran compose and validated output

```docker compose up```

![output.png](/images/output.png)

# VULN SCAN
- Used Docker Scout to check for vulnerabilites
- Originally built on python:3.11.7-slim
  - 24 low vulnerabilites found with no available fixes
  - 1 medium vulnerability found for PIP <23.3 and only affects packages installed from the Mercurial repo. Not applicable.
- Rebuit using 3.12.1-alpine based on Scout recommendation
  - All low vulnerabilites resolved due to the affected packages not being present in the smaller image
  - PIP vulnerability still existed
  - Resolved by adding a PIP upgrade in the build

![scout.png](/images/scout.png)

# BONUS CHALLENGE
  - Steps taken to generate new results under an alternative account
    1. Spin down existing infrastructure
    ![bonus_01.png](/images/bonus_01.png)
    2. Create new account utilizing GMail aliasing
    ![bonus_02.png](/images/bonus_02.png)
    3. Create new test in the web UI
    ![bonus_03.png](/images/bonus_03.png)
    4. Update local secret_user.txt and secret_token.txt with new account credentials
    5. Spin up container with new credentials
    ![bonus_04.png](/images/bonus_04.png)