# RESEARCH
- Docker Desktop - https://docs.docker.com/desktop/
- Docker Python guide - https://docs.docker.com/language/python/
- Docker Python image - https://hub.docker.com/_/python
- Dockerfile ref - https://docs.docker.com/engine/reference/builder/
- Docker compose secrets ref - https://docs.docker.com/compose/use-secrets/
- requests 2.31.0 - https://pypi.org/project/requests/
- python-dotenv - https://pypi.org/project/python-dotenv/

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