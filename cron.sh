CTF_NAME="CTFd"

#Setup persistence (run at boot).
cd /etc/cron.d/;
echo -e "SHELL=/bin/sh" > $CTF_NAME;
echo -e "PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin" >> $CTF_NAME;
echo -e "@reboot   root    /home/CTFd/CTFd/start.sh" >> $CTF_NAME;
