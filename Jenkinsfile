//create a job "pipeline" and click on "pipeline" and use "pipelinescript" and paste above Jenkinsfile. 
//If we use "pipeline script from scm" you should have "Jenkinsfile" on root folder of code repo.
//If you update any tools on global tool configuration like maven and git ,you need update in Jenkins file like "tools" section below.
//If not added any tools in global tools it will pick directly from default.
//if we dont want to install manually or do we need to use different versions of tools for different jobs use global tool config and install automatically.

pipeline {
    agent any
     tools {
        maven 'mvn3'
        // tools added in global tool configuration mention here otherwise it will not know where to pick maven
    }

    stages{
        stage('fetch code') {
          steps{
              git branch: 'vp-rem', url: "https://github.com/devopshydclub/vprofile-repo.git"
          }  
        }

        stage('Build') {
            steps {
                sh 'mvn clean install -DskipTests'
            }
            post {
                success {
                    echo "Now Archiving."
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }
        stage('Test'){
            steps {
                sh 'mvn test'
            }

        }
         stage('Code Ananlysis'){
            steps {
                sh 'mvn checkstyle:checkstyle'
            }

        }
    }
}
