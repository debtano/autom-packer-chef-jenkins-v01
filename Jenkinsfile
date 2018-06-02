pipeline {
    agent none 
    stages {
        stage('Packer Build') {
            agent {
                docker {
                    image 'debtano:mypacker'
                    args  '-it --mount type=bind,src=/home/tano/autom/v09,dst=/app'
                }
            }
        	steps {
                sh '/bin/packer build /app/centochef.jenkins.09.json'
            }
        }
        stage('Chef build') {
        	agent {
        		docker {
        			image 'debtano/centos-chef:0.9'
        			args  '--mount type=bind,src=/home/tano/autom/v09,dst=/app --mount type=volume,src=optvol,dst=/opt'
        		}
        	}
        	steps {
        		sh '/opt/chef/bin/chef-client --local-mode --override-runlist tomcat'
        	}
        }
        stage('Tomcat test') {
            agent {
        		docker {
        			image 'debtano/centos-chef:0.9'
        			args  '-it --mount type=bind,src=/home/tano/autom/v09,dst=/app --mount type=volume,src=optvol,dst=/opt'
        		}
        	} 
        	environment {
        		CATALINA_HOME = '/opt/tomcat/apache-tomcat-7.0.88'
        		JAVA_HOME     = '/opt/jdk1.8.0_171'
                JRE_HOME      = '/opt/jdk1.8.0_171/jre'
        	}
        	steps {
        	    sh '$CATALINA_HOME/bin/startup.sh'
                sh 'sleep 2m'
                sh 'curl 127.0.0.1:8080'
        	}
        }
    }
}