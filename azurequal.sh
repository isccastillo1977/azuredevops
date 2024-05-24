sudo su - ec2-user
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo yum install openssl11-devel -y
sudo yum install bzip2-devel libffi-devel -y
sudo yum groupinstall "Development Tools" -y
cd $HOME
wget https://www.python.org/ftp/python/3.10.9/Python-3.10.9.tgz
tar zxvf Python-3.10.9.tgz
cd Python-3.10.9
sed -i 's/PKG_CONFIG openssl /PKG_CONFIG openssl11 /g' configure
./configure --enable-optimizations
sudo make altinstall
sudo yum install libaio -y
aws s3 cp s3://aws-supplymgmt-edi-prod-useast1-vpn-system/oracle-instantclient19.14-basic-19.14.0.0.0-1.x86_64.rpm oracle-instantclient19.14-basic-19.14.0.0.0-1.x86_64.rpm
sudo rpm -i oracle-instantclient19.14-basic-19.14.0.0.0-1.x86_64.rpm
sudo yum install sshpass -y
sudo systemctl start docker
