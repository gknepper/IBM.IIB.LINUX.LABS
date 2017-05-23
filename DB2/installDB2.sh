# install db2 and create HRDB


# Test if root 
if (( "$EUID" != 0 ));
   then echo "Please run as root"
   exit
fi

# Install dependencies
apt install libx32stdc++6 libpam0g:i386 libaio1 ksh rpm -y

# untar
tar zxpf v11.1_linuxx64_server_t.tar.gz
cd server_t

# Create user iibadmin (db2 admin) and iibuser
getent group iibadmin || groupadd iibadmin
getent group iibuser || groupadd iibuser
getent passwd iibadmin || useradd iibadmin --create-home --shell /bin/bash -g  iibadmin
getent passwd iibuser || useradd iibuser --create-home --shell /bin/bash -g  iibuser


echo "#### Install DB2"
./db2_install -y -p SERVER -b /opt/ibm/db2/V11.1 -n

echo "#### Set iibadmin - db2icrt"
/opt/ibm/db2/V11.1/instance/db2icrt -a SERVER -p 50000 -s ese -u iibadmin iibuser

echo "#### Start db2 using iibuser"
sudo su - iibuser -c "db2start"

echo "#### Create sample database"
sudo su - iibuser -c "/opt/ibm/db2/V11.1/bin/db2sampl -sql"

echo "#### Run db2val"
sudo su - iibuser -c "/opt/ibm/db2/V11.1/bin/db2val"

echo "#### Cleaning untar installation files"
rm -rf server_t

echo "#### End Instalation"
exit


