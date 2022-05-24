pipeline {
    agent any  
    environment { DOCKERHUB_CREDENTIALS=credentials('goviolin') }
    stages {
        stage('build') {
            steps {
                sh 'docker build --tag ahmedo42/docker-violin-task .'
            }
        }
        stage ('login'){
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage ('push'){
            steps {
                sh 'docker push ahmedo42/docker-violin-task'
            }
        }
    }
	post {
		always {
			sh 'docker logout'
		}
	}
}