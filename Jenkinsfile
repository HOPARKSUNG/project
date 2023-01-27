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
        sudo docker pull rapa.iptime.org:5000/mainpage:1.0
        sudo docker pull rapa.iptime.org:5000/signup:1.0
        sudo docker pull rapa.iptime.org:5000/board:6.0
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
        sudo kubectl apply -f ingress2.yml
        
        sudo kubectl apply -f ver1.yml
        sudo kubectl apply -f ver2.yml
        sudo kubectl apply -f ingress-default.yml
        sudo kubectl apply -f ingress-weight.yml
        
        sudo chmod +x times.sh
        ./times.sh
        '''
      }
    }
    
  }
}
