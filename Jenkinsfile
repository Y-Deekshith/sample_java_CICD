pipeline {
    agent any
    tools {
        maven 'Maven3'
    }
    stages {
        stage('Git Checkout'){
            steps {
                git 'https://github.com/Y-Deekshith/sample_java_CICD.git'
            }
        }
        stage('Unit test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Integration test') {
            steps {
                sh 'mvn verify -DskipUnitTests'
            }
        }
        stage('Maven Build stage') {
            steps {
                sh 'mvn clean install'
                // sh 'mv target/*.war target/ROOT${BUILD_NUMBER}.war' 
            }
        }
        stage('static code analysis') {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'sonarqube') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage('Quality check') {
            steps {
                script {
                        waitForQualityGate abortPipeline: false, credentialsId: 'sonarqube'
                }
            }
        }
        stage('Uplode artifact') {
            steps {
                script {
                    nexusArtifactUploader artifacts: [[artifactId: 'maven-web-application', classifier: '', file: 'maven-web-application/target/tesla.war', type: 'war']], credentialsId: 'nexus-auth', groupId: 'com.mt', nexusUrl: 'ec2-52-90-97-151.compute-1.amazonaws.com:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-public', version: '0.0.2-SNAPSHOT'
                }
            }
        }
    }
}