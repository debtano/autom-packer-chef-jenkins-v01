#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# yum_package 'java-1.8.0-openjdk-devel' do
#	action :install
#	source "/tmp/java-1.8.0-openjdk-devel-1.8.0.171-8.b10.el7_5.x86_64.rpm"
# end

group 'tomcat' do
	action :create
end

user 'tomcat' do
	action :create
	home '/opt/tomcat'
	shell '/bin/nologin'
	manage_home false
	gid 'tomcat'
end

directory '/opt/tomcat' do
	action :create
	owner 'tomcat'
	group 'tomcat'
	mode '0755'
end

cookbook_file '/opt/jdk-8u171-linux-x64.tar.gz' do
	action :create
	source 'jdk-8u171-linux-x64.tar.gz'
end

cookbook_file '/opt/tomcat/apache-tomcat-7.0.88.tar.gz' do
	action :create
	source 'apache-tomcat-7.0.88.tar.gz'
end

execute 'untar java' do
	action :run
	cwd '/opt'
	command '/bin/tar xzvf jdk-8u171-linux-x64.tar.gz'
end


execute 'untar tomcat' do
	action :run
	cwd '/opt/tomcat'
	command '/bin/tar xzvf apache-tomcat-7.0.88.tar.gz'
end