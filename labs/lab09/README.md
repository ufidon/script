# its372
Course materials and demos for labs

## Lab09: Perl programming I - Company network planning & management

### 1. Description

Practice Perl programming by implementing a simple Perl script for company network planning & management.

### 2. Tasks (50%)
1. (20%) Complete the two TODOs in [sub.pl](./code/sub.pl) and their tests
2. (30%) Complete the two TODOs in [netplan.pl](./code/netplan.pl), use the program to generate three local area network plans:
   1. (10%) Type A
   2. (10%) Type B
   3. (10%) Type C

### 3. Review questions (50%)

1. (10%) Install then play with [inetsim](https://www.inetsim.org/)
2. (10%) Install nmap and scan localhost
3. (25%) Investigate the source code of inetsim, modify the source code of the Echo module and Datetime module to customize the reply message and verify with ncat.
4. (5%) Stop and disable inetsim service

## References
* [CIDR: Classless Inter-Domain Routing](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
* [Private network](https://en.wikipedia.org/wiki/Private_network)
* [CIDR Calculator](http://www.subnet-calculator.com/cidr.php)
* [Integer IP address to Quad IPv4 address one liner or close to it?](https://www.perlmonks.org/?node_id=786521)
* [IP address - long to dotted-quad to long](https://www.perlmonks.org/?node_id=546367)
* [inetsim](https://www.inetsim.org/)
* [SystemdForUpstartUsers](https://wiki.ubuntu.com/SystemdForUpstartUsers)
  * [systemctl](http://manpages.ubuntu.com/manpages/focal/man1/systemctl.1.html)
  * [systemd service](http://manpages.ubuntu.com/manpages/focal/man5/systemd.service.5.html)
