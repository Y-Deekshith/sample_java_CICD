pipeline {
    agent { label 'DEV' }
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
                sh 'mv target/*.war target/ROOT-${BUILD_NUMBER}.war' 
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
        // stage('Uplode artifact') {
        //     steps {
        //         script {
        //             // nexusArtifactUploader artifacts: [[artifactId: 'springboot', classifier: '', file: 'target/Uber.jar', type: 'jar']], credentialsId: 'nexus-auth', groupId: 'com.example', nexusUrl: 'ec2-34-202-235-119.compute-1.amazonaws.com:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '1.0.0'
        //             nexusArtifactUploader artifacts: [
        //                 [artifactId: 'springboot',
        //                  classifier: '',
        //                   file: 'target/Uber.jar',
        //                    type: 'jar'
        //                    ]
        //                    ],
        //                     credentialsId: 'nexus-auth',
        //                      groupId: 'com.example',
        //                       nexusUrl: 'ec2-34-202-235-119.compute-1.amazonaws.com:8081',
        //                        nexusVersion: 'nexus3',
        //                         protocol: 'http',
        //                          repository: 'maven-snapshots',
        //                           version: '1.0.0-SNAPSHOT'
        //         }
        //     }
        // }
    }
}