FROM centos
MAINTAINER Marco Bazzani
WORKDIR /root
RUN yum update -y
RUN yum install -y wget rpm-build selinux-policy httpd-devel
RUN yum -y groupinstall "Development Tools" 
RUN mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
RUN echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros
RUN wget http://ftp.redhat.com/pub/redhat/linux/enterprise/6Server/en/JBEWS/SRPMS/mod_cluster-native-1.3.1-6.Final_redhat_2.ep7.el6.src.rpm
RUN rpmbuild --rebuild mod_cluster-native-1.2.9-4.Final_redhat_2.ep6.el6.src.rpm 
RUN rpm -ivh  /root/rpmbuild/RPMS/x86_64/mod_cluster-native-1.2.9-4.Final_redhat_2.el6.x86_64.rpm
ENTRYPOINT ["/bin/bash"]

