amazon-linux-extras install epel -y
yum install https://repo.percona.com/yum/percona-release-latest.noarch.rpm -y
percona-release enable psmdb-44 release
yum install percona-server-mongodb htop -y 
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf

hostnamectl set-hostname mongo.master.in
echo "$(hostname -I | awk '{print $1}')  $(hostname -f)" >> /etc/hosts

service mongod start

mongo --eval "db.getSiblingDB('admin').createUser({user: 'admin', pwd: 'admin@123', roles: ['root']})"

mkdir /var/mongo-key

#openssl rand -base64 756 > /var/mongo-key/mongodb-keyfile

chown -R mongod.mongod /var/mongo-key/

chmod 400 /var/mongo-key/mongodb-keyfile

echo "security:
  authorization: enabled
  keyFile: /var/mongo-key/mongodb-keyfile
  redactClientLogData: true
  relaxPermChecks: true
  " >> /etc/mongod.conf

echo "setParameter:
  enableLocalhostAuthBypass: false
  auditAuthorizationSuccess: true
  " >> /etc/mongod.conf


service mongod start

mongo -u admin -p admin@123 --authenticationDatabase 'admin'


#Command for force to become primary rs.stepDown(90,30) 
