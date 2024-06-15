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
apt -qqy install ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libfuse-dev libglib2.0-dev libgmp3-dev \
libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libpython3-dev libreadline-dev \
libssl-dev libtool lrzsz mkisofs msmtp ninja-build p7zip p7zip-full patch pkgconf python3 \
python3-pyelftools python3-setuptools qemu-utils rsync scons squashfs-tools subversion swig texinfo \
uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev

#clean
apt autoremove -qqy&&apt clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
rm -rf /usr/share/dotnet /usr/local/lib/android /opt/ghc
