apt-get update&&apt upgrade -y
#sshd
apt-get install -yqq sudo ssh net-tools vim language-pack-zh-hans bash-completion fonts-wqy-microhei
mkdir /var/run/sshd
echo 'export LC_ALL=zh_CN.UTF-8' >> /etc/profile
echo 'root:root' |chpasswd
useradd --create-home --no-log-init --shell /bin/bash 123
adduser 123 sudo
echo '123:123' | chpasswd
echo '123 ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo 'export DISPLAY=:0' >> /etc/profile
sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
mkdir /root/.ssh
mkdir /home/123/.ssh

#lede
apt-get -qq install $(curl -fsSL git.io/depends-ubuntu-1804)

#clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -rf /usr/share/dotnet /usr/local/lib/android /opt/ghc
