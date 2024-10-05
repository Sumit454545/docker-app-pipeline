pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git 'https://github.com/<your-username>/my-docker-app.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build the JAR file
                    sh 'mvn clean package'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t <your-dockerhub-username>/mydockerapp:latest .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker Hub
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'

                    // Push the Docker image
                    sh 'docker push <your-dockerhub-username>/mydockerapp:latest'
                }
            }
        }
    }

    environment {
        DOCKER_USERNAME = credentials('dockerhub-username') // Jenkins credential ID for Docker Hub username
        DOCKER_PASSWORD = credentials('dockerhub-password') // Jenkins credential ID for Docker Hub password
    }
}
