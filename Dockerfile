# 1. Use an official, lightweight Python image
FROM python:3.9-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy our Python script from our laptop into the container
COPY main.py .

# 4. Tell the container what command to run when it starts
CMD ["python", "main.py"]