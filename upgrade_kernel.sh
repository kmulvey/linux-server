git checkout master
git pull
cat `/bin/ls -t /boot/config-* | head -n1` > .config
yes "" | make oldconfig
make -j`grep processor /proc/cpuinfo | wc -l`
sudo cp arch/`uname -p`/boot/bzImage "/boot/vmlinuz-"`make kernelrelease`
sudo make modules_install
sudo cp System.map "/boot/System.map-"`make kernelrelease`
sudo dracut "" `make kernelrelease`
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
