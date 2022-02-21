apt-get update&&apt upgrade -y
#sshd
apt-get install -yqq sudo ssh net-tools vim screen language-pack-zh-hans bash-completion fonts-wqy-microhei
mkdir /var/run/sshd
echo 'export LC_ALL=zh_CN.UTF-8' >> /etc/profile
echo 'root:root' |chpasswd
useradd --create-home --no-log-init --shell /bin/bash user
adduser user sudo
echo 'user:user' | chpasswd
echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo 'export DISPLAY=:0' >> /etc/profile
sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
mkdir /root/.ssh
mkdir /home/user/.ssh

#lede
apt-get -qqy install $(curl -fsSL git.io/depends-ubuntu-2004)

#clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -rf /usr/share/dotnet /usr/local/lib/android /opt/ghc
