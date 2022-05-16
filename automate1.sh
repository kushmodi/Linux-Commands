#1/bin/bash

YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
ORANGE='\033[0;33m'

echo -e "${YELLOW}Colourful"
echo -e "${PURPLE}Installation of java"

echo "${ORANGE}Checking java version"
java --version
if [ "$?" == 0 ]
then
echo "${GREEN}Java is already installed"
else
apt install openjdk-8-jdk -y
java --version
fi 

echo "${CYAN}Step 1. Create a group and a user for  tomcat"
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

echo "${CYAN}Step 2. Download tomcat tar file"
cd /tmp
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz 

echo "${CYAN}Step3. Creating a directory for tomcat and unpack the tar file in it"


tar -xvf apache-tomcat-9*tar.gz -C /opt/tomcat --strip-components=1

echo "${CYAN}Step4. Providing permission"
cd /opt/tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chmod -R 777 conf
sudo chmod 777  conf
sudo chown -R tomcat /webapps/work/temp/logs/

echo "${CYAN}Step5. Open a file called tomcat.service in the /etc/systemd/system directory by executing the below command"
echo "[Unit]" >> /etc/systemd/system/tomcat.service
echo "Description=Apache Tomcat Web Application Container" >> /etc/systemd/system/tomcat.service 
echo "After=network.target" >> /etc/systemd/system/tomcat.service
echo "[Service]" >> /etc/systemd/system/tomcat.service
echo "Type=forking" >> /etc/systemd/system/tomcat.service
echo "Environment=JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_HOME=/opt/tomcat" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_BASE=/opt/tomcat" >> /etc/systemd/system/tomcat.service
echo "Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'" >> /etc/systemd/system/tomcat.service
echo "Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'" >> /etc/systemd/system/tomcat.service
echo "ExecStart=/opt/tomcat/bin/startup.sh" >> /etc/systemd/system/tomcat.service
echo "ExecStop=/opt/tomcat/bin/shutdown.sh" >> /etc/systemd/system/tomcat.service
echo "User=tomcat" >> /etc/systemd/system/tomcat.service
echo "Group=tomcat" >> /etc/systemd/system/tomcat.service
echo "UMask=0007" >> /etc/systemd/system/tomcat.service
echo "RestartSec=15" >>/etc/systemd/system/tomcat.service
echo "Restart=always" >> /etc/systemd/system/tomcat.service
echo "[Install]" >> /etc/systemd/system/tomcat.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/tomcat.service

echo "${CYAN}Step6. Execution of command to relode demons"
systemctl daemon-reload

echo "${CYAN}Step7. Start the Tomcat Service"
systemctl start tomcat

echo "${CYAN}Step8. Check tomcat status"
systemctl status tomcat
