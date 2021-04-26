#!/usr/bin/env perl

##### This perl program is used to find 
# 1. all users on a Linux machine
# 2. the groups each user joined
# 3. find the number of groups each user joined
#####
use utf8;
use strict;
use warnings;

## all users are saved in the file /etc/passwd, in a terminal, 
# 1. run command 'getent passwd' to find the information about each user
# 2. run command 'man 5 passwd' to find the description of the file /etc/passwd
##

## find all users on a Linux machine and save in a variable
my $userout = qx"getent passwd ";

## split each line of the user output, save them in an array
my @lines = split '\n', $userout;

## create a hash to save all users
# 1. a hash key is a user name
# 2. the hash value contains the groups the user identified by the key joined
##
my %users = ();

for my $line (@lines){
	my @cols = split ':', $line;
  my @empty = ();
	$users{$cols[0]} = \@empty;
}


print "user name : list of groups the user joined : number of groups the user joined\n";
print "-----------------------------------------------------------------------------\n";
for (keys %users)
{
  ## the groups a user joined can be gotten with command 'groups <user name>'
  # 1. In a terminal, run command 'groups $USER' to see the output
  # 2. The output format: 
  # username : groupname1 groupname2 groupname3 ... groupnamen
  # 3. the first groupname1 is usually the same as the username, but it is a groupname!
  ##
	my $cmdout = qx"groups $_";
	my @cols = split ' ', $cmdout;
	
	push(@{$users{$_}}, @cols[2..$#cols]);
	
  ## find the number of groups each user joined
	my $numgroups = scalar @{$users{$_}};
	print "$_: @{$users{$_}} : $numgroups\n";
}






