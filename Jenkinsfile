pipeline {
    agent any
    stages {
        stage ('Main Stage') {
            steps { 
                script {
                    stage("Clone") {
                        script {
                          sh "git checkout"
                        }
                    }
                 }
            }
        }
        stage ('second') {
            steps { 
                script {
                    stage("upate") {
                        script {
                          sh "sed -i 's/latest/'${BUILD_NUMBER}'/g' README.md"
                        }
                    }
                 }
            }
        }
        stage ('second') {
            steps { 
                script {
                    stage("upate") {
                        script {
                          sshagent (credentials: ['git']) {
                              sh("git add .")
                              sh("git status")
                              sh("git commit -m '${BUILD_NUMBER}'")
                              sh('git push -u origin master')
                          }
                        }
                    }
                 }
            }
        }
    }
}
        
        
        
        
        
        
        
        
        
        
        
