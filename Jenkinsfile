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
                          sh "git commit -am '${BUILD_NUMBER}'"
                          sh "git push origin HEAD:master"
                        }
                    }
                 }
            }
        }
    }
}
        
        
        
        
        
        
        
        
        
        
        
