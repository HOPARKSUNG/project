pipeline {
  agent any
  stages {
    stage('git scm update') {
      steps {
        git url: 'https://github.com/HOPARKSUNG/project', branch: 'main'
      }
    }
    stage('docker build') {
      steps {
        sh '''
        sudo docker pull rapa.iptime.org:5000/mainpage:2.0
        sudo docker pull rapa.iptime.org:5000/signup:2.0
        sudo docker pull rapa.iptime.org:5000/board:2.0
        '''
      }
    }
    
    stage('deploy k8s') {
      steps {
        sh '''
        sudo kubectl apply -f ingress.yml
        sudo kubectl apply -f mainpage.yml
        sudo kubectl apply -f signup.yml
        sudo kubectl apply -f board.yml
        '''
      }
    }
    
  }
}
