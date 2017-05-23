# create/reset HRDB


# Test if root 
if (( "$EUID" != 0 ));
   then echo "Please run as root"
   exit
fi


echo "#### drop HRDB database"
su - iibuser -c "/opt/ibm/db2/V11.1/bin/db2 drop database HRDB" 

echo "#### Create HRDB TABLE EMPLOYEE"
su - iibuser -c "/opt/ibm/db2/V11.1/bin/db2 -tvsf $PWD/Begin_HRDB_DB1-UNIX.ddl"

echo "#### Create HRDB TABLE DEPARTMENT"
su - iibuser -c "/opt/ibm/db2/V11.1/bin/db2 -tvsf $PWD/Begin_HRDB_Tables1-UNIX.ddl"


