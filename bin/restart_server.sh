#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display messages
echo_info() {
    echo -e "\e[34m[INFO]\e[0m $1"
}

echo_error() {
    echo -e "\e[31m[ERROR]\e[0m $1" >&2
}

# Ensure the script is run from within a Git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo_error "This script must be run inside a Git repository."
    exit 1
fi

# Get the current Git branch
CURRENT_BRANCH=$(git symbolic-ref --short HEAD)

if [ -z "$CURRENT_BRANCH" ]; then
    echo_error "Unable to determine the current Git branch."
    exit 1
fi

echo_info "Current Git branch: $CURRENT_BRANCH"

# Fetch the latest changes from the remote repository
echo_info "Fetching latest changes from remote..."
git fetch

# Reset the current branch to match the remote branch
REMOTE_BRANCH="origin/$CURRENT_BRANCH"
echo_info "Resetting local branch '$CURRENT_BRANCH' to match '$REMOTE_BRANCH'..."
git reset --hard "$REMOTE_BRANCH"

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null && ! command -v docker compose &> /dev/null; then
    echo_error "Docker Compose is not installed. Please install it and try again."
    exit 1
fi

# Determine the Docker Compose command
if command -v docker compose &> /dev/null; then
    DOCKER_COMPOSE_CMD="docker compose"
else
    DOCKER_COMPOSE_CMD="docker-compose"
fi

# Build and start Docker containers in detached mode
echo_info "Building and starting Docker containers..."
$DOCKER_COMPOSE_CMD up --build -d

echo_info "Running migration"
$DOCKER_COMPOSE_CMD run --rm rails bundle exec rake db:migrate

echo_info "Deployment completed successfully."
