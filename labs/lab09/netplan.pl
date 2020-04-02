#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use POSIX;

# netplan.pl is the main program
# complete sub.pl first by finishing its TODO 1 & TODO 2
# after getting the desired output, copy the implementation of ip2Int and int2Ip from sub.pl to netplan.pl
# don't modify anything out of the two required functions

###### network plan ######
# Description: as an IT engineer, one task is to plan company networks:
# 1. allocate IP address blocks to departments
# 2. determine the network configuration for each department
# 3. configure firewall rules according to company security policies
# References:
# a) https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing
# b) https://en.wikipedia.org/wiki/Private_network
# c) CIDR Calculator: http://www.subnet-calculator.com/cidr.php
############

use constant endebug => 1;
use constant enxdebug => 0;

my $description = qq{
    This small perl program assists IT engineers plan company networks.
    It can give you ALL possible private sub networks based on the 
    required number of hosts.

    Functions:
        1. Enter the number of hosts required
        2. Choose a possible sub network
        3. The program will provide a detailed network configuration 
        for this subnet:
            a) subnet ID or network address
            b) gateway IP address
            c) broadcast IP address
            d) list of all allowed IP addresses for hosts
};

my $usage = <<_USAGE_;
    Usage: ./netplan.pl 
        1. follow the hints
        2. type q to quit the program


_USAGE_

print $description;
print $usage;

my %privateIpBlocks =(
    # Type => ('start IP', 'end IP', bits, max hosts)
    # refer to https://en.wikipedia.org/wiki/Private_network
    'A' => ['10.0.0.0','10.255.255.255', 24, 16_777_214],
    'B' => ['172.16.0.0', '172.31.255.255', 20, 1_048_574],
    'C' => ['192.168.0.0', '192.168.255.255', 16, 65_534]
);

sub getClass{
    my $hosts = shift;
    return "" unless (defined $hosts && $hosts ne "");

    if($hosts <= $privateIpBlocks{'C'}->[3]){
        return 'ABC';
    }
    elsif($hosts <= ${$privateIpBlocks{'B'}}[3]){
        return 'AB';
    }
    elsif($hosts <= $privateIpBlocks{'A'}->[3]){
        return 'A';
    }
    else{
        return 'N';
    }
}

sub ip2Int{
    # TODO 1: convert an IPv4 address to an integer
    # Requirements:
    # 1. Exception handling: no parameter is provided or the first parameter is an empty string
    # 2. convert an IPv4 address to an integer, ex.:
    # a) '192.168.111.222', convert each byte into hex, get 'C0.A8.6F.DE'
    # b) convert 'C0.A8.6F.DE' into hex string '0xC0A86FDE'
    # c) convert hex string '0xC0A86FDE' into integer 3232264158
    # 3. return the integer



}

sub int2Ip{
    # TODO 2: convert an integer to IPv4 address
    # Requirements:
    # 1. Exception handling: no parameter is provided or the first parameter is an empty string
    # 2. convert an integer to IPv4 address, ex.:
    # a) 3232264158, convert it into  hex string with 8 hex digits, get 'C0A86FDE'
    # b) convert 'C0A86FDE' into hex string 'C0.A8.6F.DE'
    # c) convert each hex group into decimal number string '192.168.111.222'
    # 3. return the IPv4 address

}


######## main logic ########
my ($line, $cmd, $hostnum);
LOOP: while(1)
{
    print "\n\n------------------------------------\nPress any key to continue except q to quit\n\n";
    chomp($cmd=<STDIN>);
    last if ($cmd eq "q");

    print "Enter the number of hosts: ";
    chomp($hostnum = <STDIN>);

    my $class = getClass($hostnum);
    next if($class eq "");
    if($class eq "N")
    {
        print "No private subnet can accommodate $hostnum hosts!\n";
        next;
    }
    

    my @privnets = split '', $class;
    my $subnets = join ', ', @privnets;
    print "$hostnum hosts can be accommodated in any one from private $subnets networks.\n\n";

    my $hostbits = ceil(log($hostnum+3)/log(2));
    print "The number of host bits is $hostbits \n\n";

    my ($anets, $abits, $bnets, $bbits, $cnets, $cbits, $seltype);

    if($class eq 'ABC'){
        $abits = $privateIpBlocks{'A'}->[2] - $hostbits;
        $bbits = $privateIpBlocks{'B'}->[2] - $hostbits;
        $cbits = $privateIpBlocks{'C'}->[2] - $hostbits;

        $anets = 2**$abits;
        $bnets = 2**$bbits;
        $cnets = 2**$cbits;

        print "$hostnum hosts can be hosted by each of\n";
        print "$anets type-A private networks\n";
        print "$bnets type-B private networks\n";
        print "$cnets type-C private networks\n";

        while(1){
            print "\n Please choose a type (A|B|C): ";
            $seltype = <STDIN>;
            chomp($seltype);
            $seltype = uc($seltype);
            if($seltype eq 'A' || $seltype eq 'B' || $seltype eq 'C'){
                last;
            }else{
                print "Invalid choice, please choose again.\n";
            }
        }       

    }
    elsif($class eq 'AB'){
        $abits = $privateIpBlocks{'A'}->[2] - $hostbits;
        $bbits = $privateIpBlocks{'B'}->[2] - $hostbits;
        $anets = 2**$abits;
        $bnets = 2**$bbits;

        print "$hostnum hosts can be hosted by each of\n";
        print "$anets type-A private networks\n";
        print "$bnets type-B private networks\n";

        while(1){
            print "\n Please choose a type (A|B): ";
            $seltype = <STDIN>;
            chomp($seltype);
            $seltype = uc($seltype);
            if($seltype == 'A' || $seltype == 'B'){
                last;
            }else{
                print "Invalid choice, please choose again.\n";
            }
        }
    }
    elsif($class eq 'A'){
        $abits = $privateIpBlocks{'A'}->[2] - $hostbits;
        $anets = 2**$abits;
        print "$hostnum hosts can be hosted by each of\n";
        print "$anets type-A private networks\n";
        $seltype = 'A';
    }else{
        print "Something is wrong!\n";
    }

    if(enxdebug){
        my($ip,$iip);
        $ip="192.168.111.222";
        $iip = ip2Int($ip);
        my $rip = int2Ip($iip);
        print "ip=$ip, iip=$iip, rip=$rip\n";
    }

    my $netbits = $privateIpBlocks{$seltype}->[2] - $hostbits;
    my $baseip = $privateIpBlocks{$seltype}->[0];

    my $ibaseip = ip2Int($baseip);
    my $isnets = 2**$netbits;
    my $ihnetip = $ibaseip | (($isnets - 1) << $hostbits);
    my $hnetip = int2Ip($ihnetip);

    print "\nThe are $isnets  available private sub networks from $baseip to $hnetip\n";

    my $selnet=0;
    $isnets--;
    while(1){
        print "\n Please choose a subnet (0..$isnets): ";
        $selnet = <STDIN>;
        chomp($selnet);

        if($selnet >= 0 && $selnet <= $isnets){
            last;
        }else{
            print "\nInvalid choice, please choose again.\n";
        }
    }

    my ($snetip, $snetmask, $scidr, $bcip, $gwip, $startip, $endip, @hostips, $hostlist, $uhosts);

    $uhosts = 2**$hostbits -3 - $hostnum;
    $snetip = $ibaseip | ($selnet << $hostbits);
    $snetmask = (0xFFFF_FFFF << $hostbits) & 0xFFFF_FFFF;
    $bcip = $snetip + (2**$hostbits - 1);
    $gwip = $snetip + 1;
    $startip = $gwip + 1;
    $endip = $bcip - 1;
    @hostips = ($startip .. $endip);

    $snetip = int2Ip($snetip);
    $snetmask = int2Ip($snetmask);
    $scidr = sprintf("%s/%d", $snetip, 32-$hostbits );
    $bcip = int2Ip($bcip);
    $gwip = int2Ip($gwip);
    $startip = int2Ip($startip);
    $endip = int2Ip($endip);

    if(endebug){
        for(@hostips){
            $_=int2Ip($_);
        }
        $hostlist = join("\n", @hostips);       
    }


    print "\nOne of the private network configurations are:\n";
    print "Subnet IP: $snetip\n";
    print "Subnet mask: $snetmask\n";
    print "Subnet CIDR: $scidr\n";
    print "The broadcast IP: $bcip\n";
    print "Gateway IP: $gwip\n";
    print "DNS server: 8.8.8.8\n";
    print "Alternative DNS server: 8.8.4.4\n";
    print "Available host IP range: $startip - $endip\n";
    if(endebug){
        print "Available host IP list: \n$hostlist\n";
    }
    
    print "Unused number of host IPs: $uhosts \n";

}

print "\nThank you for using this network planning tool.\n"