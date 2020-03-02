# add users
useradd -ms /bin/bash admin
useradd -ms /bin/bash Devries
useradd -ms /bin/bash Vittal
useradd -ms /bin/bash Dieringer
useradd -ms /bin/bash Hamami
useradd -ms /bin/bash Korus
useradd -ms /bin/bash Schmid
useradd -ms /bin/bash Vogt

# set password
echo 'admin:password' | chpasswd
echo 'Devries:password' | chpasswd
echo 'Vittal:password' | chpasswd
echo 'Dieringer:password' | chpasswd
echo 'Hamami:password' | chpasswd
echo 'Korus:password' | chpasswd
echo 'Schmid:password' | chpasswd
echo 'Vogt:password' | chpasswd

# create home directory
mkdir -p /home/admin && chown -R admin /home/admin
mkdir -p /home/Devries && chown -R Devries /home/Devries
mkdir -p /home/Vittal && chown -R Vittal /home/Vittal
mkdir -p /home/Dieringer && chown -R Dieringer /home/Dieringer
mkdir -p /home/Hamami && chown -R Hamami /home/Hamami
mkdir -p /home/Korus && chown -R Korus /home/Korus
mkdir -p /home/Schmid && chown -R Schmid /home/Schmid
mkdir -p /home/Vogt && chown -R Vogt /home/Vogt
