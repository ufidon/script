#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use POSIX;

sub ip2Int{
    # TODO: convert an IPv4 address to an integer
    # Requirements:
    # 1. Exception handling: no parameter is provided or the first parameter is an empty string
    # 2. convert an IPv4 address to an integer, ex.:
    # a) '192.168.111.222', convert each byte into hex, get 'C0.A8.6F.DE'
    # b) convert 'C0.A8.6F.DE' into hex string '0xC0A86FDE'
    # c) convert hex string '0xC0A86FDE' into integer 3232264158
    # 3. return the integer


}

sub int2Ip{
    # TODO: convert an integer to IPv4 address
    # Requirements:
    # 1. Exception handling: no parameter is provided or the first parameter is an empty string
    # 2. convert an integer to IPv4 address, ex.:
    # a) 3232264158, convert it into  hex string with 8 hex digits, get 'C0A86FDE'
    # b) convert 'C0A86FDE' into hex string 'C0.A8.6F.DE'
    # c) convert each hex group into decimal number string '192.168.111.222'
    # 3. return the IPv4 address

}

######## main test logic ########

my(@ip,@iip);
@ip=("192.168.111.222","192.168.0.0","172.20.0.0","172.31.0.172", "10.0.0.0", "10.0.0.255","10.255.255.255","0.0.0.0", "255.255.255.255");

for(@ip){
    push(@iip, ip2Int($_));
}


my @rip = ();
for(@iip){
    push(@rip, int2Ip($_));
}

for my $i (0..$#ip){
    print $ip[$i] . "->" . $iip[$i] . "->" . $rip[$i] ."\n";
}