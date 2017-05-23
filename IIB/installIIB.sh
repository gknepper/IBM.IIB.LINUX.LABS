#/bin/bash
# IIB does not install just run after untar

# untar in iibuser directory / IBM
mkdir ~/IBM
tar zxpvf 10.0.0.8-IIB-LINUX64-DEVELOPER.tar.gz --directory ~/IBM

# Accept licence and test 
cd ~/IBM/iib-10.0.0.8
./iib accept license silently
./iib verify install

# Create shortcut to IIB Toolkit in iibuser Desktop
cat <<END > /home/iibuser/Desktop/IBM\ Integration\ Toolkit.desktop
#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Icon=/home/iibuser/IBM/iib-10.0.0.8/tools/icon.xpm
Icon[en_US]=/home/iibuser/IBM/iib-10.0.0.8/tools/icon.xpm
Exec=/home/iibuser/IBM/iib-10.0.0.8/iib toolkit
Name[en_US]=IBM Integration Toolkit
Name=IBM Integration Toolkit
END
