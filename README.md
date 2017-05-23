# IBM.IIB.LINUX.LABS
My scripts to create the VM (ubuntu mate 17.04) to IBM IIB Self-study labs

## Links to IBM IIB self study labs:
* https://developer.ibm.com/integration/docs/ibm-integration-bus/self-study-labs/
* https://www.ibm.com/developerworks/community/groups/service/html/communityoverview?communityUuid=5b25e82f-8252-4233-b206-66e886835d1d

## Links to IBM trial/demo version
* IBM WebSphere MQ Advanced for Developers V8.0 - **Download mqadv_dev80_linux_x86-64.tar.gz**
> https://www.ibm.com/developerworks/downloads/ws/wmq/

* DB2 11.1 data server trial for Linux® on AMD64 and Intel® EM64T systems (x64) - **Download v11.1_linuxx64_server_t.tar.gz**
> https://www.ibm.com/developerworks/downloads/im/db2/index.html?ca=dct-trial-

* IBM Integration Bus for Developers. for Linux for System x (64 bit), Windows (64bit) English U.S. - **Download 10.0.0.8-IIB-LINUX64-DEVELOPER.tar.gz**
> https://www-01.ibm.com/marketing/iwm/iwm/web/pick.do?source=swg-wmbfd

## Creating VM
I used the ubuntu-mate version 17.04 because works beautifully with vmware. It's not necessary install vmware tools. this version comes with open-vmware-tools native and auto screen autofit and shared folders works too.
> https://ubuntu-mate.org/download/

## Step One - Install prereqs (OPTIONAL) 
> inicialSetup.sh
install firefox git vim 

## Step Two - DB2
> installDB2.sh
* *Need run as root*
 * install libx32stdc++6 libpam0g:i386 libaio1 ksh rpm  - DB2 prereqs
 * Create iibadmin and iibuser with password (passw0rd)
 * install DB2
 * create sample database ( easiest way to create db2 system tables )
 * run db2val to validate installation

> beginHRDB.sh
* create HRDB database - Begin_HRDB_DB1-UNIX.ddl
* create HRDB tables - Begin_HRDB_Tables1-UNIX.ddl

## Step Three - MQ
> installMQ.sh
* *Need install as iibuser*
* install MQ
* create QM IB10QMGR
* create shortcut to *IBM MQ Explorer* in iibuser desktop

## Step Four - IIB
> installIIB.sh
* *Need install as iibuser*
* install IIB
* create shortcut to *IBM IIB Toolkit* in iibuser desktop
