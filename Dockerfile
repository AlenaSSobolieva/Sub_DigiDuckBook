FROM ubuntu:latest
LABEL authors="Olena"

# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory to /app

ENV ENV APP_HOME=/app
WORKDIR $APP_HOME/app

# Install any needed packages specified in requirements.txt
COPY pyproject.toml $APP_HOME/pyproject.toml
COPY poetry.lock $APP_HOME/poetry.lock

RUN pip install poetry
#RUN poetry config virtualenvs.create false && poetry install --only main

# Copy the current directory contents into the container at /app
COPY . .

# Make port 80 available to the world outside this container
EXPOSE 3000


# Run your Python application
CMD ["python", "app.py"]
