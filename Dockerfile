FROM python:3.12.1-alpine

# Prevents Python from writing pyc files.
ENV PYTHONDONTWRITEBYTECODE=1

# Keeps Python from buffering stdout and stderr to avoid situations where
# the application crashes without emitting any logs due to buffering.
ENV PYTHONUNBUFFERED=1

WORKDIR /app

ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    pyuser

RUN python -m pip install --no-cache-dir --upgrade pip

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

USER pyuser

COPY . .

CMD python ./thousandeyes_tests.py