pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds') // Single credential ID for Docker Hub
        GITHUB_CREDENTIALS = credentials('github-token') // GitHub credentials
    }
    stages {
        stage('Checkout') {
            steps {
                script {
                    echo "Checking out the repository..."
                    // Use the GitHub credentials
                    git url: 'https://github.com/Sumit454545/docker-app-pipeline.git',
                        credentialsId: 'github-token', // Use your actual GitHub credentials ID
                        branch: 'main' // Specify the branch if necessary
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    echo "Building the project with Maven..."
                    sh 'mvn clean package'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building the Docker image..."
                    sh 'docker build -t skk4545/mydockerapp:latest .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    echo "Logging into Docker Hub..."
                    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                    echo "Pushing the Docker image to Docker Hub..."
                    sh 'docker push skk4545/mydockerapp:latest'
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}
