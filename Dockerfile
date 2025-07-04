FROM python:3.10-slim

WORKDIR /app

RUN pip install --upgrade pip setuptools wheel

COPY pyproject.toml ./pyproject.toml
COPY src ./src
COPY run.py ./run.py

# Copy frontend files so Flask can serve them
COPY frontend/templates ./frontend/templates
COPY frontend/static ./frontend/static

ENV PYTHONPATH=/app/src
RUN pip install -e .

EXPOSE 5000

CMD ["python", "run.py"]
