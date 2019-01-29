pipeline {
	agent any
    stages {
        stage('Build') {
            steps {
                powershell 'mvn -B -e -DskipTests clean package'
            }
        }
		stage('Test') {
            steps {
                powershell 'mvn test'
            }
            post {
                always {
                    junit 'server/target/surefire-reports/*.xml'
                }
            }
        }
		stage('Deliver') {
            steps {
                powershell ('''
				Write-Output "Deploying the war file to Tomcat"
                $Name = (ls .\\webapp\\target\\*.war).Name
				copy  ".\\webapp\\target\\$Name" "C:\\Program Files\\Apache Software Foundation\\Tomcat 9.0\\webapps" | Out-Null
                $Name = $Name.Replace(".war","")
				Write-Output "Deployment completed and hosted at http://localhost:8081/$Name"
				''')
            }
        }
    }
}