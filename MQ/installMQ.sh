# INSTALL MQ - http://www-01.ibm.com/support/docview.wss?uid=swg21656068
# https://www.ibm.com/developerworks/websphere/library/techarticles/0705_salkosuo/0705_salkosuo-pdf.pdf

# Install dependencies 
sudo apt-get install rpm -y

# Untar 
tar zxpvf mqadv_dev80_linux_x86-64.tar.gz
cd /home/iibuser/Downloads/MQServer

# Accept licence
sudo ./mqlicense.sh -accept

# Install product
sudo rpm -ivh --nodeps --force-debian MQSeriesRuntime-*.rpm
sudo rpm -ivh --nodeps --force-debian MQSeriesGSKit-*.rpm MQSeriesJRE-*.rpm
sudo rpm -ivh --nodeps --force-debian MQSeriesClient*.rpm
sudo rpm -ivh --nodeps --force-debian MQSeriesExplorer*.rpm
sudo rpm -ivh --nodeps --force-debian MQSeriesServer*.rpm

## Create QM e Queues - MQExplorer:
sudo su - mqm -c '/opt/mqm/bin/crtmqm IB10QMGR'
sudo su - mqm -c '/opt/mqm/bin/strmqm IB10QMGR'

# Run MQ Explorer Command Line OK
# xhost+
# sudo su - mqm -c "/opt/mqm/bin/MQExplorer"

# Create shortcut in iibuser desktop
cat <<END > /home/iibuser/Desktop/IBM\ MQ\ Explorer.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Icon=/opt/mqm/mqexplorer/eclipse/icon.xpm
Icon[en_US]=/opt/mqm/mqexplorer/eclipse/icon.xpm
Exec=sh -c "xhost + ; gksudo -u root 'su - mqm -c '/opt/mqm/bin/MQExplorer''"
Name[en_US]=IBM MQ Explorer
Name=IBM MQ Explorer
END
