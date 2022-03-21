// pipeline {
//   agent { label 'WORKSTATION' }
//   options {
//     ansiColor('xterm')
//   }
//
//   parameters {
//     choice(name: 'ENV', choices: ['DEV', 'PRoD'], description: 'Choose Env')
//     string(name: 'COMPONENT', defaultValue: '', description: 'Which App Component')
//   }
//
//   environment {
//     SSH = credentials('CENTOS')
//   }
//
//   stages {
//     stage('Create Server') {
//       steps {
//         sh 'bash ec2-launch.sh ${COMPONENT} ${ENV} &>/tmp/log'
//       }
//     }
//
//     stage('Ansible Playbook Run') {
//       steps {
//         script {
//           env.ANISIBLE_TAG=COMPONENT.toUpperCase()
//         }
//         sh 'sleep 120'
//         sh 'ansible-playbook -i roboshop.inv roboshop.yml -e ENV=${ENV} -t ${ANISIBLE_TAG} -e ansible_password=${SSH_PSW} -u ${SSH_USR} '
//       }
//     }
//   }
//
// }

//==========Example=================
pipeline {
  agent { label 'WORKSTATION' }
options {
     ansiColor('xterm')
   }
  stages {
    stage('Ansible Playbook Run') {
      steps {
        sh 'ansible --version;hostname -I'
        sh 'uname -a;uptime;date'
      }
    }
  }

}