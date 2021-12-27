pipeline {
  agent { label 'WORKSTATION' }
  options {
    ansiColor('xterm')
  }

  parameters {
    choice(name: 'ENV', choices: ['DEV', 'PROD'], description: 'Choose Env')
    string(name: 'COMPONENT', defaultValue: '', description: 'Which App Component')
  }

  stages {
    stage('Create Server') {
      steps {
        sh 'bash ec2-launch.sh ${COMPONENT}'
      }
    }

    stage('Ansible Playbook Run') {
      steps {
        script {
          def ANISIBLE_TAG=toUpperCase(COMPONENT)
        }
        sh 'ansible-playbook -i roboshop.inv roboshop.yml -e ENV=${ENV} -t ${ANISIBLE_TAG}'
      }
    }
  }

}

