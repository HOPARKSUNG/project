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
        sudo docker pull rapa.iptime.org:5000/ipnginx:sunghotest
        sudo docker pull rapa.iptime.org:5000/hnginx:sunghotest
        '''
      }
    }
    
    stage('deploy k8s') {
      steps {
        sh '''
        sudo kubectl delete -f present.yml
        sudo kubectl delete -f ingress-default.yml
        sudo kubectl delete -f newver.yml
        sudo kubectl delete -f ingress-weight.yml
        sudo kubectl apply -f present.yml
        sudo kubectl apply -f ingress-default.yml
        sudo kubectl apply -f newver.yml
        sudo kubectl apply -f ingress-weight.yml
        '''
      }
    }
    
  }
}
