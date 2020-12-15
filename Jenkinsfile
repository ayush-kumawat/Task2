pipeline {
    agent any
    stages {
        stage ('Main Stage') {
            steps { 
                script {
                    stage("Clone") {
                        script {
                          git 'https://github.com/ayush-kumawat/Task2.git'
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
                          sh "git config --global user.name "ayushkumawat""
                          sh "git config --global user.email ayush21kumawat@gmail.com"
                          sh "git commit -am '${BUILD_NUMBER}'"
                          sh "git push -u origin/master"
                        }
                    }
                 }
            }
        }
    }
}
        
        
        
        
        
        
        
        
        
        
        
