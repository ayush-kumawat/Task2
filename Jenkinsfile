pipeline {
    agent any
    environment
    {
        VERSION = "${BUILD_NUMBER}"
        PROJECT = 'argojen'
        IMAGE = "$PROJECT:$VERSION"
        ECRURL = 'https://232383674343.dkr.ecr.us-east-1.amazonaws.com/argojen'
        ECRCRED = 'ecr:us-east-1:aws'
    }
    stages {
         stage('Image Build'){
            steps{
                script{
                    stage("Build docker") {
                      script {
                        docker.build('$IMAGE')
                      }
                    }
                }
            }
        }
        stage('Push Image'){
            steps{
                script{
                  stage("Image push") {
                    script {
                      docker.withRegistry(ECRURL, ECRCRED)
                      {
                        docker.image(IMAGE).push()
                      }
                    }
                }
            }
        }
    }
    stage ('tag change') {
            steps { 
                script {
                    stage("upate tag") {
                        script {
                          sh '''
                            k=`cat ./k8s/test.yml | grep image |awk -F ":" '{print $3}'`
                            sed -i 's/jen:.*$/jen:'${BUILD_NUMBER}'/g' ./k8s/deploy_jen.yml
                          '''
                        }
                    }
                 }
            }
        }
        stage ('git updtae') {
            steps { 
                script {
                    stage("push to github") {
                        script {
                          sshagent (credentials: ['git']) {
                              sh("git add .")
                              sh("git status")
                              sh("git commit -m '${BUILD_NUMBER}'")
                              sh("git pull origin master")
                              sh('git push origin HEAD:master')
                          }
                        }
                    }
                 }
            }
        }
    }
    post
    {
        always
        {
           sh "docker rmi $IMAGE | true"
        }
    }
}
