pipeline {
   agent {
       docker {
           image '34717954807/pywd'
       }
   }

   stages {
      stage('Build') {
         steps {
            echo 'Compilando ou resolvendo as dependencias do projeto'
            sh 'pip install -r requirements.txt'
         }
      }
      stage('Tests') {
          steps {
            echo 'Executando testes de regressão'
            sh 'robot -d ./log -e todo tests/'
          }
          post {
              always {
                  robot otherFiles: '**/*.png', outputPath: 'log'
              }
          }
      }
      stage('UAT') {
          steps {
            echo 'Aguardando testes de aceitação do usuário.'
            input(message: 'Go to Production?', ok: 'Yes')
          }
      }
      stage('Production') {
          steps {
             echo 'App is Ready :)' 
          }
      }
   }
}