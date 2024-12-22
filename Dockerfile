# Use Python as base image
FROM python:3.10-slim

# Install necessary tools
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

#set working directory
WORKDIR /test_apis

#Copy necessary files
COPY . /test_apis
#Install dependencies
RUN pip install -r requirement.txt

#Define the command to run test
CMD ["robot","--outputdir", "/tests/logs", "tests/GetBookingsAPT.robot"]