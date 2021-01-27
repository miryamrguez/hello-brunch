#!/usr/bin/env groovy
pipeline {
    agent any
    options {
        ansiColor('xterm')
    }

    stages {
        stage('Build') {
            steps {
		//No necesito el repo puesto que quien ha llegado aquí, ya sabe la dirección
                //git 'https://github.com/miryamrguez/hello-brunch.git'
                sh 'docker-compose build'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}
