# add users
useradd -ms /bin/bash dkorus
useradd -ms /bin/bash mschmid
useradd -ms /bin/bash user1
useradd -ms /bin/bash user2
useradd -ms /bin/bash user3
useradd -ms /bin/bash user4
useradd -ms /bin/bash user5
useradd -ms /bin/bash user6
useradd -ms /bin/bash user7
useradd -ms /bin/bash user8
useradd -ms /bin/bash user9
useradd -ms /bin/bash user10

# set password
echo 'dkorus:korus_dieter' | chpasswd
echo 'mschmid:schmid_markus' | chpasswd
echo 'user1:user1_pwd' | chpasswd
echo 'user2:user2_pwd' | chpasswd
echo 'user3:user3_pwd' | chpasswd
echo 'user4:user4_pwd' | chpasswd
echo 'user5:user5_pwd' | chpasswd
echo 'user6:user6_pwd' | chpasswd
echo 'user7:user7_pwd' | chpasswd
echo 'user8:user8_pwd' | chpasswd
echo 'user9:user9_pwd' | chpasswd
echo 'user10:user10_pwd' | chpasswd

# create home directory
mkdir -p /home/dkorus && chown -R dkorus /home/dkorus
mkdir -p /home/mschmid && chown -R mschmid /home/mschmid
mkdir -p /home/user1 && chown -R user1 /home/user1
mkdir -p /home/user2 && chown -R user2 /home/user2
mkdir -p /home/user3 && chown -R user3 /home/user3
mkdir -p /home/user4 && chown -R user4 /home/user4
mkdir -p /home/user5 && chown -R user5 /home/user5
mkdir -p /home/user6 && chown -R user6 /home/user6
mkdir -p /home/user7 && chown -R user7 /home/user7
mkdir -p /home/user8 && chown -R user8 /home/user8
mkdir -p /home/user9 && chown -R user9 /home/user9
mkdir -p /home/user10 && chown -R user10 /home/user10
