#!/bin/bash

# Set environment variables
SONARQUBE_URL="localhost:9000"
SONAR_TOKEN="your_sonar_token" # Generate a token in SonarQube
YOUR_REPO=/home/mkmks/coding/set-web-monorepo
PROJECT_KEY="test-routing" # Project key in SonarQube

# Run the Docker command
docker run \
    --rm \
    --network="host" \
    -e SONAR_HOST_URL="http://${SONARQUBE_URL}" \
    -e SONAR_TOKEN="${SONAR_TOKEN}" \
    -v "${YOUR_REPO}:/usr/src" \
    sonarsource/sonar-scanner-cli \
    -Dsonar.projectKey="${PROJECT_KEY}"