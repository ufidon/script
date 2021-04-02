# its372
Course materials and demos for labs

## Lab10: Perl programming II - Aggregation of user info in Linux

### 1. Description

Practice Perl programming by implementing a simple Perl script for aggregation of user info in Linux.

### 2. Tasks (60%)
In this lab, write a Perl program named it as systats.pl that can get the statistics of groups and users on a computer. For each subtask here, complete the implementation code (10%) and its test (10%).

1. (20%) Find the largest groups and their users: refer to [getcmdout.pl](./code/getcmdout.pl)
2. (20%) Find the most sociable users (who joined the maximum number of groups) and the groups they are in: refer to [suser.pl](./code/suser.pl)
3. (20%) Save the statistics above in a report file: refer to [record.pl](./code/record.pl)

### 3. Review questions (40%)
1. (20%) Create a systemd service with template [ipv4conv.service](./code/ipv4conv.service) and 
2. (20%) test it.


## References

* [SystemdForUpstartUsers](https://wiki.ubuntu.com/SystemdForUpstartUsers)
  * [systemctl](http://manpages.ubuntu.com/manpages/focal/man1/systemctl.1.html)
  * [systemd service](http://manpages.ubuntu.com/manpages/focal/man5/systemd.service.5.html)
* [Writing a Systemd Supervised Service with Perl](https://perlgeek.de/blog-en/perl-tips/2017-systemd-supervised-daemon-perl.html)
  * [Linux::Systemd::Daemon](https://metacpan.org/pod/Linux::Systemd::Daemon)
  * [Creating a Linux service with systemd](https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6)
  * [Create Daemon (service) from a Perl script using Daemon::Control](https://perlmaven.com/create-daemon-from-perl-script)
  * [Creating a Linux service with systemd](https://medium.com/@benmorel/creating-a-linux-service-with-systemd-611b5c8b91d6)
  * [Replacing rc.local in systemd Linux systems](https://www.redhat.com/sysadmin/replacing-rclocal-systemd)
* [CronHowto](https://help.ubuntu.com/community/CronHowto)
  * [Zeit – A GUI Front-end To Crontab To Schedule Jobs In Linux](https://ostechnix.com/zeit-a-gui-front-end-to-crontab-to-schedule-jobs-in-linux/)