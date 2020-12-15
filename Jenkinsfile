pipeline {
    agent any
    stages {
        stage ('Main Stage') {
            steps { 
                script {
                    stage("Clone") {
                        script {
                          sh "git status"
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
        stage ('third') {
            steps { 
                script {
                    stage("commit") {
                        script {
                          sshagent (credentials: ['git']) {
                              sh("git add .")
                              sh("git status")
                              sh("git commit -m '${BUILD_NUMBER}'")
                              sh("git pull origin master")
                              sh('git push')
                          }
                        }
                    }
                 }
            }
        }
    }
}
        
        
        
        
        
        
        
        
        
        
        
