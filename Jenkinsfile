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
        sudo kubectl delte -f present.yml
        sudo kubectl delte -f ingress-default.yml
        sudo kubectl delte -f newver.yml
        sudo kubectl delte -f ingress-weight.yml
        sudo kubectl apply -f present.yml
        sudo kubectl apply -f ingress-default.yml
        sudo kubectl apply -f newver.yml
        sudo kubectl apply -f ingress-weight.yml
        '''
      }
    }
    
  }
}
