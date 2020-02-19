#!/bin/bash
USRS=("max" "moritz")
PWDS=("max_pwd" "moritz_pwd")

for ((i=0;i<${#USRS[@]};++i));
do
    printf "%s is in %s\n" "${USRS[i]}" "${PWDS[i]}"
    useradd -ms /bin/bash ${USRS[i]}
    echo ${USRS[i]}:${PWDS[i]} | chpasswd
    mkdir -p /home/${USRS[i]} && chown -R ${USRS[i]} /home/${USRS[i]}

done

#useradd -ms /bin/bash ubuntu
#echo 'ubuntu:ubuntu_pwd' | chpasswd
#mkdir -p /home/ubuntu && chown -R ubuntu /home/ubuntu
#useradd -rm -d /home/ubuntu -s /bin/bash -G 1000 -u 1003 -p ubuntu_pwd ubuntu 
