pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // Single credential ID for Docker Hub
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/<your-username>/my-docker-app.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t <your-dockerhub-username>/mydockerapp:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker Hub
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                    // Push the Docker image
                    sh 'docker push <your-dockerhub-username>/mydockerapp:latest'
                }
            }
        }
    }
}
