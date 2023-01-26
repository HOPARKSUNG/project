pipeline {
  agent any
  stages {
    stage('git scm update') {
      steps {
        git url: 'https://github.com/HOPARKSUNG/jen', branch: 'main'
      }
    }
    stage('docker build') {
      steps {
        sh '''
        sudo docker build -t rapa.iptime.org:5000/nginx:sunghoda10 .
        sudo docker push rapa.iptime.org:5000/nginx:sunghoda10
        '''
      }
    }
    
    stage('deploy k8s') {
      steps {
        sh '''
        sudo kubectl apply -f test.yml
        '''
      }
    }
    
  }
}
