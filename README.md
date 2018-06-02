# autom-packer-chef-jenkins-v01
Automatization exercise with jenkins, dockers, packer and chef

This is a basic automation exercise that can help others an easy start.
It contains the basic files required :
  1. Dockerfile
  2. Jenkinsfile 
  3. A json file for Packer (centochef.jenkins.09.json)
  4. A basic default.rb chef recipe
  
Along with that I used it the following _artifacts_ but you can change them changing the references in the appropiate files:
  1. A chef-client rpm (chef-14.1.12-1.el7.x86_64.rpm)                          //Used by packer to bootstrap chef
  2. A centos:latest docker image                                               //Used by packer as base image
  3. A jdk 8 instaler for linux (jdk-8u171-linux-x64.tar.gz)                    //Used by chef as pre-req to tomcat
  4. A tomcat instaler for linux (apache-tomcat-7.0.88.tar.gz)                  //Used by chef to install tomcat
  5. A alpine:latest docker image                                               //Used by me to create a small alpine +packer
  6. The packer binaries to install in linux (packer_1.2.3_linux_amd64.zip)     //Alpine + packer exec + docker
  
# Basic flow
I think that this example is simple an easy to follow but i will give some indications to help get along with it.
0. Follow the Jenkinsfile - it could be used (with corrections) to build the pipeline
1. Packer use docker builder and a pre-existing docker image (centos) 
2. Packer use file and shell provisioners to upload chef client file, install it and them upload a local cookbook named "tomcat" including the default.rb recipe
3. Packer post-processor register the new docker image in local registry
4. Jenkins , using that new image, calls the chef-client , in local mode, to execute the cookbook
5. The execution of the cookbook will install jdk and tomcat with required configuration
6. Jenkins again, as an exercise, call the docker image, set some env variables and startup tomcat
7. As a very simple test, jenkins execute a curl against port 8080 after a 2m sleep to allow tomcat to start

# To be fixed / improved
1. I need to parametrize artifacts names and env variables. Everything is harcoded now so take notice that you'll need to fix references to local directories in my machine
2. Add a bitbucket/github stage so jenkins pull this files from there 
3. Artifacts shoulb be in a repository, not local directories
4. ....

Hope it helps starting !
