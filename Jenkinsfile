pipeline {
    agent any

    stages {
        stage('拉取代码') {
            steps {
                echo '拉取代码'
            }
        }
        stage('编译') {
            steps {
                echo '编译'
                sh '''cd spring3-mvc-maven-xml-hello-world 
                mvn package -Dmaven.skip.test=true
                        cd ../'''
            }
        }
        stage('部署') {
            steps {
                echo '部署'
            }
        }
        
    }
}
