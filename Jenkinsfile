pipeline {
    agent any

    environment {
        IMAGE_NAME = 'html-site'
    }

    triggers {
        pollSCM('* * * * *')
    }

    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Build Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} -t ${IMAGE_NAME}:latest .'
            }
        }
        stage('Verify') {
            steps {
                sh 'docker images | grep ${IMAGE_NAME}'
            }
        }
    }
}
