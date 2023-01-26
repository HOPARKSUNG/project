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
        sudo docker build -t rapa.iptime.org:5000/ipnginx:sunghotest .
        sudo docker push rapa.iptime.org:5000/ipnginx:sunghotest
        sudo docker build -t rapa.iptime.org:5000/hnginx:sunghotest .
        sudo docker push rapa.iptime.org:5000/hnginx:sunghotest
        '''
      }
    }
    
    stage('deploy k8s') {
      steps {
        sh '''
        sudo kubectl apply -f present.yml
        sudo kubectl apply -f ingress-default.yml
        sudo kubectl apply -f newver.yml
        sudo kubectl apply -f ingress-weight.yml
        '''
      }
    }
    
  }
}
