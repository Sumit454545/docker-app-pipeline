pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // Single credential ID for Docker Hub
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Sumit454545/docker-app-pipeline.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t skk4545/mydockerapp:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Login to Docker Hub
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                    // Push the Docker image
                    sh 'docker push skk4545/mydockerapp:latest'
                }
            }
        }
    }
}
