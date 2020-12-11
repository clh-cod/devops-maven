pipeline {
    agent any

    stages {
        stage('拉取代码') {
            steps {
                echo '拉取代码'
                checkout([$class: 'SubversionSCM', additionalCredentials: [], excludedCommitMessages: '', excludedRegions: '', excludedRevprop: '', excludedUsers: '', filterChangelog: false, ignoreDirPropChanges: false, includedRegions: '', locations: [[cancelProcessOnExternalsFail: true, credentialsId: '65a4399c-3e35-4c33-ae54-6fecc67984d6', depthOption: 'infinity', ignoreExternalsOption: true, local: '.', remote: 'svn://116.62.111.4/svn']], quietOperation: true, workspaceUpdater: [$class: 'UpdateUpdater']])
            }
        }
        stage('编译') {
            agent { docker 'maven:3-alpine' }
            steps {
                echo '编译'
                sh '''cd spring3-mvc-maven-xml-hello-world 
                mvn package -Dmaven.skip.test=true
                        cd ../'''
            }
        }
        stage('部署') {
            steps {
                echo '编译'
                // sshPublisher(publishers: [sshPublisherDesc(configName: '192.168.29.146', transfers: [], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
        
    }
}
