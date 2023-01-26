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
        sudo docker build -t rapa.iptime.org:5000/mainpage:1.0 .
        sudo docker push rapa.iptime.org:5000/mainpage:10.0
        sudo docker build -t rapa.iptime.org:5000/signup:1.0 .
        sudo docker push rapa.iptime.org:5000/signup:10.0
        sudo docker build -t rapa.iptime.org:5000/board::1.0 .
        sudo docker push rapa.iptime.org:5000/board::10.0
        '''
      }
    }
    
    stage('deploy k8s') {
      steps {
        sh '''
        sudo kubectl delete -f mainpage.yml
        sudo kubectl delete -f singup.yml
        sudo kubectl delete -f board.yml
        sudo kubectl delete -f ingress.yml
        sudo kubectl delete -f present.yml
        sudo kubectl delete -f ingress-default.yml
        sudo kubectl delete -f newver.yml
        sudo kubectl delete -f ingress-weight.yml
        
        sudo kubectl apply -f mainpage.yml
        sudo kubectl apply -f singup.yml
        sudo kubectl apply -f board.yml
        sudo kubectl apply -f ingress.yml
        '''
      }
    }
    
  }
}
