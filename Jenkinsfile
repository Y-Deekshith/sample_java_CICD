pipeline {
    agent { label 'DEV' }
    // agent any
    tools {
        maven 'Maven3'
    }
    environment {
        dockerImage = ''
        AWS_ACCOUNT_ID = "737711606783"
        AWS_DEFAULT_REGION = "us-east-1"
        IMAGE_REPO_NAME = "devops"
        IMAGE_TAG = "$BUILD_NUMBER"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
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
        stage('Uploading Artifact to cloud') {
            steps {
                sh 'aws s3 ls'
                echo "${BUILD_NUMBER}"
                // s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'dees3devops', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: true, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: '*.war', storageClass: 'STANDARD_IA', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'dees3devops', userMetadata: []
                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'dees3devops', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: true, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: 'target/*.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'dees3devops', userMetadata: []
            }
        }
        // stage('Building our image') {
        //     steps{
        //         script {
        //             dockerImage = docker.build "${IMAGE_REPO_NAME}:$BUILD_NUMBER"
        //         }
        //     }
        // }
        stage('Pushing to ECR') {
            steps{
                script {
                    docker.withRegistry(
                        "https://"${AWS_ACCOUNT_ID}".dkr.ecr."${AWS_DEFAULT_REGION}".amazonaws.com",
                        "ecr:"${AWS_DEFAULT_REGION}":Aws_Cred" ) {
                            def myImage = docker.build('devops')
                            myImage.push("$IMAGE_TAG")
                        }        
                // sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
                // sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }
}