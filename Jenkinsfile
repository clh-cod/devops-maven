pipeline {
  agent any
  stages {
    stage('拉取代码') {
      steps {
        echo '拉取代码'
      }
    }
    stage('编译打包') {
      steps {
        echo '编译打包'
        withMaven(maven: 'maven') {
          sh '''cd spring3-mvc-maven-xml-hello-world
                  mvn package -Dmaven.skip.test=true
                  cd ../
                  tar -zcvf spring3-mvc-maven-xml-hello-world.tar.gz spring3-mvc-maven-xml-hello-world'''
        }

      }
    }
    stage('部署') {
            steps {
                echo '部署'
                sshPublisher(publishers: [sshPublisherDesc(configName: '192.168.206.155', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd /root/docker-tomcat 
                tar zxvf spring3-mvc-maven-xml-hello-world.tar.gz
                cd /root/docker-tomcat/spring3-mvc-maven-xml-hello-world 
                sh docker-image.sh ''', execTimeout: 1200000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '/docker-tomcat', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'spring3-mvc-maven-xml-hello-world.tar.gz')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
  }
}
