pipeline {
    agent {
        label 'docker'
    }
    environment { 
        LOCAL_IMAGE = "${JOB_NAME}:${BUILD_ID}"
        GITHUB_ACCOUNT = credentials('github-credentials')
        REMOTE_IMAGE = "docker.pkg.github.com/${GITHUB_ACCOUNT_USR}/${JOB_NAME}/${LOCAL_IMAGE}"
    }
    stages {
       stage('build') {
            steps {
                sh "docker build -t ${LOCAL_IMAGE} ."
            }
        }
        stage('test') {
            steps {
                sh "docker run -i ${LOCAL_IMAGE} ansible --version"
            }
        }
        stage('publish') {
            steps {
                sh "docker tag ${LOCAL_IMAGE} ${REMOTE_IMAGE}"
                sh "docker login docker.pkg.github.com -u ${GITHUB_ACCOUNT_USR} -p ${GITHUB_ACCOUNT_PSW}"
                sh "docker push ${REMOTE_IMAGE}"
                sh "docker logout docker.pkg.github.com"
            }
        }
    }
}
