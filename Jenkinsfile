pipeline {
    agent any
    stages {
        stage("Clone Repo") {
            steps {
                git([url: 'git@github.com:ONLYOFFICE-QA/doc-builder-testing.git', branch: 'master', credentialsId: 'VitaliySerovGitHub'])
            }
        }
        stage("Run Debian release") {
            steps {
                script {
                    sh("docker build -t docbuilder-debian-release . ; docker run -t docbuilder-debian-release")
                }
            }
        }
//         stage("Run Debian next release") {
//             steps {
//                 script {
//                     sh("docker build -t docbuilder-debian-next-release -f dockerfiles/debian-next-release/Dockerfile . ;
//                     docker run -t docbuilder-debian-next-release")
//                 }
//             }
//         }
//         stage("Run RockyLinux release") {
//             steps {
//                 script {
//                     sh("docker build -t docbuilder-rockylinux-release -f dockerfiles/rockylinux-latest/Dockerfile . ;
//                     docker run -t docbuilder-rockylinux-release")
//                 }
//             }
//         }
//         stage("Run Debian develop") {
//             steps {
//                 script {
//                     sh("docker build -t docbuilder-debian-develop -f dockerfiles/debian-develop/Dockerfile . ;
//                     docker run -t docbuilder-debian-develop")
//                 }
//             }
//         }
//         stage("Publish results") {
//         }
    }
}