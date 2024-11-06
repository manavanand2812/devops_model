pipeline {
    agent any
    
    environment {
        // Set Docker image name and tag
        IMAGE_NAME = 'your-image-name'
        IMAGE_TAG = 'latest'
    }
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from Git repository
                git branch: 'main', url: 'https://github.com/your-repo/java-app.git'
            }
        }
        
        stage('Build with Maven') {
            steps {
                script {
                    // Run Maven build to compile the Java application
                    sh 'mvn clean install'
                }
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    // Build Docker image using Dockerfile in the repository
                    sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
                }
            }
        }
        
        stage('Test') {
            steps {
                script {
                    // Run unit tests using Maven
                    sh 'mvn test'
                }
            }
        }
        
        stage('Push to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub and push the Docker image
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                        sh "echo $DOCKER_PASS | docker login --username $DOCKER_USER --password-stdin"
                        sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
                    }
                }
            }
        }
    }
    
    post {
        success {
            echo 'Build and Docker image creation successful!'
        }
        failure {
            echo 'Something went wrong. Check the logs.'
        }
    }
}
