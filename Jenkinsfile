pipeline {
    agent any
    environment {
        DOCKER_CREDENTIALS_ID = '00685d94-26e1-4d70-82be-ddcdb696295d' 
        DEV_DOCKER_REPO = 'google4627/dev'
        PROD_DOCKER_REPO = 'google4627/prod'
        DOCKER_IMAGE_TAG = 'latest'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: env.BRANCH_NAME, url: 'https://github.com/google4627/Capstone.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def repo = (env.BRANCH_NAME == 'master') ? "${PROD_DOCKER_REPO}" : "${DEV_DOCKER_REPO}"
                    docker.build("${repo}:${DOCKER_IMAGE_TAG}")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    def repo = (env.BRANCH_NAME == 'master') ? "${PROD_DOCKER_REPO}" : "${DEV_DOCKER_REPO}"
                    docker.withRegistry('', "${DOCKER_CREDENTIALS_ID}") {
                        docker.image("${repo}:${DOCKER_IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}

