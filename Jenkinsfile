pipeline {
    agent any
    stages {
        stage ('Main Stage') {
            steps { 
                script {
                    stage("Clone") {
                        script {
                          sh "git checkout origin/master"
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
                          sh "git config --global user.name 'ayushkumawat'"
                          sh "git config --global user.email ayush21kumawat@gmail.com"
                          sh "git commit -am '${BUILD_NUMBER}'"
                          sh "git push origin/master"
                        }
                    }
                 }
            }
        }
    }
}
        
        
        
        
        
        
        
        
        
        
        
