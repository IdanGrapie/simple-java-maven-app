# Java CI/CD Pipeline with Docker, GitHub Actions, and SSH

## Description
This project implements a continuous integration and deployment (CI/CD) pipeline for a Java application using GitHub Actions for automation, Docker for containerization, and SSH for secure remote operations. The pipeline automates the building, tagging, and deployment of a Docker image to an AWS EC2 instance.

## Architecture
The CI/CD pipeline is composed of:

- **GitHub Actions**: Automates the build, tagging, and deployment processes.
- **Docker**: Containerizes the Java application for consistent deployment environments.
- **AWS EC2**: Serves as the host for the Dockerized application, managed through manual setup or infrastructure as code tools like Terraform.
- **SSH**: Facilitates secure communication and operations on the remote EC2 instance.

## Prerequisites
- An AWS account with EC2 access.
- A Docker Hub account to store container images.
- Java and Maven to build the Java application.
- SSH access set up on the target EC2 instance.

## Setup and Installation

### GitHub Actions Setup
1. Fork or clone the repository containing the pipeline (`.github/workflows/ci-cd.yml`).
2. Configure the following GitHub Secrets for your repository:
   - `DOCKER_USERNAME`: Your Docker Hub username.
   - `DOCKER_PASSWORD`: Your Docker Hub password.
   - `SSH_PRIVATE_KEY`: Your private SSH key for secure communication with the EC2 instance.

### Docker Hub Configuration
Ensure your Docker Hub account is ready to receive the Docker images pushed from the pipeline.

### AWS EC2 Configuration
1. Set up your AWS EC2 instance, ensuring SSH access is configured correctly.
2. Place the public key on the EC2 instance and store the private key securely as a GitHub Secret.

## Usage
Once the pipeline successfully runs:
- The Docker image of the Java application is built and pushed to Docker Hub with an auto-incremented version tag.
- The image is then pulled and run on the specified AWS EC2 instance using SSH commands.

To interact with the deployed application:
- SSH into the EC2 instance using your stored private key.
- Use Docker CLI commands such as `docker ps` to inspect running containers or `docker logs <container_id>` to view application logs.

## Security
- SSH is used for secure command execution on the EC2 instance, with all commands sent over an encrypted channel.
- GitHub Secrets are used to store
