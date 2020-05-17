FROM centos:latest
WORKDIR /projects/jenkins
VOLUME jenkins_12may
RUN yum install wget -y
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
RUN yum install jenkins -y
RUN yum install java-11-openjdk-src.x86_64    dejavu-sans-fonts fontconfig  git sudo -y 
RUN echo -e "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER jenkins
ENV USER jenkins
EXPOSE 8080
CMD ["java","-jar","/usr/lib/jenkins/jenkins.war"]
