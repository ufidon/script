#!/usr/bin/env perl

# This is an unit test for netplan.pl
# complete this first by finishing TODO 1 & TODO 2
# after getting the desired output, copy the implementation of ip2Int and int2Ip to netplan.pl
# don't modify anything out of the two required functions

use utf8;
use strict;
use warnings;
use POSIX;

sub ip2Int{
    # TODO 1: convert an IPv4 address to an integer
    # Hints: You may use any method you feel comfortable
    # Method 1:
    # 1. Exception handling: no parameter is provided or the first parameter is an empty string
    # 2. convert an IPv4 address to an integer, ex.:
    # a) '192.168.111.222', convert each byte into hex, get 'C0.A8.6F.DE'
    # b) convert 'C0.A8.6F.DE' into hex string '0xC0A86FDE'
    # c) convert hex string '0xC0A86FDE' into integer 3232264158
    # 3. return the integer
    # Method 2: 
    # 1. https://www.perlmonks.org/?node_id=786521
    # 2. https://www.perlmonks.org/?node_id=546367


}

sub int2Ip{
    # TODO 2: convert an integer to IPv4 address
    # Hints: You may use any method you feel comfortable
    # Method 1:
    # 1. Exception handling: no parameter is provided or the first parameter is an empty string
    # 2. convert an integer to IPv4 address, ex.:
    # a) 3232264158, convert it into  hex string with 8 hex digits, get 'C0A86FDE'
    # b) convert 'C0A86FDE' into hex string 'C0.A8.6F.DE'
    # c) convert each hex group into decimal number string '192.168.111.222'
    # 3. return the IPv4 address
    # Method 2: 
    # 1. https://www.perlmonks.org/?node_id=786521
    # 2. https://www.perlmonks.org/?node_id=546367

}

######## main test logic ########

my(@ip,@iip);
@ip=("192.168.111.222","192.168.0.0","172.20.0.0","172.31.0.172", "10.0.0.0", "10.0.0.255","10.255.255.255","0.0.0.0", "255.255.255.255");

for(@ip){
    push(@iip, ip2Int($_)?ip2Int($_):0);
}


my @rip = ();
for(@iip){
    push(@rip, int2Ip($_)?int2Ip($_):0);
}

for my $i (0..$#ip){
    print $ip[$i] . "->" . "$iip[$i]" . "->" . $rip[$i] ."\n";
}

# output should be:
# 192.168.111.222->3232264158->192.168.111.222
# 192.168.0.0->3232235520->192.168.0.0
# 172.20.0.0->2886991872->172.20.0.0
# 172.31.0.172->2887712940->172.31.0.172
# 10.0.0.0->167772160->10.0.0.0
# 10.0.0.255->167772415->10.0.0.255
# 10.255.255.255->184549375->10.255.255.255
# 0.0.0.0->0->0.0.0.0
# 255.255.255.255->4294967295->255.255.255.255