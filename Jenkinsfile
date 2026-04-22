pipeline {
    agent any

    environment {
        DOCKERHUB_USER = 'elmaws108'
        IMAGE_NAME     = 'html-site'
        IMAGE          = "${DOCKERHUB_USER}/${IMAGE_NAME}"
    }

    triggers {
        pollSCM('* * * * *')
    }

    stages {
        stage('Checkout') {
            steps { checkout scm }
        }
        stage('Build & Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DH_USER',
                    passwordVariable: 'DH_PASS')]) {
                    sh '''
                        echo "$DH_PASS" | docker login -u "$DH_USER" --password-stdin
                        docker build -t ${IMAGE}:${BUILD_NUMBER} -t ${IMAGE}:latest .
                        docker push ${IMAGE}:${BUILD_NUMBER}
                        docker push ${IMAGE}:latest
                        docker logout
                    '''
                }
            }
        }
    }

    post {
        always { sh 'docker image prune -f || true' }
    }
}
