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
        // stage('Unit test') {
        //     steps {
        //         sh 'mvn test'
        //     }
        // }
        // stage('Integration test') {
        //     steps {
        //         sh 'mvn verify -DskipUnitTests'
        //     }
        // }
        stage('Maven Build stage') {
            steps {
                sh 'mvn clean install'
                sh 'mv target/*.war target/maven-web-application-${BUILD_NUMBER}.war'
            }
        }
        // stage('static code analysis') {
        //     steps {
        //         script {
        //             withSonarQubeEnv(credentialsId: 'sonarqube') {
        //                 sh 'mvn clean package sonar:sonar'
        //             }
        //         }
        //     }
        // }
        // stage('Quality check') {
        //     steps {
        //         script {
        //                 waitForQualityGate abortPipeline: false, credentialsId: 'sonarqube'
        //         }
        //     }
        // }
        stage('Uplode artifact') {
            steps {
                    nexusArtifactUploader artifacts: [[artifactId: 'maven-web-application', classifier: '', file: 'target/maven-web-application-${BUILD_NUMBER}.war', type: 'war']], credentialsId: 'nexus-auth', groupId: 'com.mt', nexusUrl: 'ec2-3-95-214-152.compute-1.amazonaws.com:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '0.0.2-SNAPSHOT'
            }
        }
    }
}