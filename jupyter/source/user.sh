# add users
useradd -ms /bin/bash admin
useradd -ms /bin/bash devries
useradd -ms /bin/bash vittal
useradd -ms /bin/bash dieringer
useradd -ms /bin/bash hamami
useradd -ms /bin/bash korus
useradd -ms /bin/bash schmid
useradd -ms /bin/bash vogt

# set password
echo 'admin:password' | chpasswd
echo 'devries:password' | chpasswd
echo 'vittal:password' | chpasswd
echo 'dieringer:password' | chpasswd
echo 'hamami:password' | chpasswd
echo 'korus:password' | chpasswd
echo 'schmid:password' | chpasswd
echo 'vogt:password' | chpasswd

# create home directory
mkdir -p /home/admin && chown -R admin /home/admin
mkdir -p /home/devries && chown -R devries /home/devries
mkdir -p /home/vittal && chown -R vittal /home/vittal
mkdir -p /home/dieringer && chown -R dieringer /home/dieringer
mkdir -p /home/hamami && chown -R hamami /home/hamami
mkdir -p /home/korus && chown -R korus /home/korus
mkdir -p /home/schmid && chown -R schmid /home/schmid
mkdir -p /home/vogt && chown -R vogt /home/vogt
