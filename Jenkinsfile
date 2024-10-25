pipeline {
    agent any
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
        // Remove the GitHub credentials from environment since we're using it directly in git checkout
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Simplified git checkout - using the credential ID that exists in your Jenkins
                checkout([$class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/Sumit454545/docker-app-pipeline.git',
                        credentialsId: 'ea2ab4e3-7729-49c4-b136-d236b07d8a97'  // Using the credential ID from your logs
                    ]]
                ])
            }
        }
        
        stage('Build') {
            steps {
                script {
                    echo "Building the project with Maven..."
                    // Add error handling for Windows
                    bat 'mvn clean package'  // Changed from sh to bat for Windows
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    echo "Building the Docker image..."
                    bat 'docker build -t skk4545/mydockerapp:latest .'  // Changed from sh to bat
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    echo "Logging into Docker Hub..."
                    // Modified for Windows syntax
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', passwordVariable: 'DOCKERHUB_PSW', usernameVariable: 'DOCKERHUB_USR')]) {
                        bat "echo %DOCKERHUB_PSW% | docker login -u %DOCKERHUB_USR% --password-stdin"
                    }
                    echo "Pushing the Docker image to Docker Hub..."
                    bat 'docker push skk4545/mydockerapp:latest'  // Changed from sh to bat
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
        always {
            bat 'docker logout'  // Added logout for cleanup, changed to bat
        }
    }
}
