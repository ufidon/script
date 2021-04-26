#!/usr/bin/env perl

##### This perl program is used to find 
# 1. all groups on a Linux machine
# 2. all members inside each group
# 3. find the largest groups, i.e. the groups contain the maximum number of users
# 4. there may be more than one maximum groups
#####
use utf8;
use strict;
use warnings;

## all groups are saved in the file /et/group, in a terminal, 
# 1. run command 'cat /etc/group' to find all groups
# 2. run command 'man 5 group' to find the description of the file /etc/group
##

## save all groups in a variable
my $lsout = qx"cat /etc/group";
#print $lsout;

## split each line of the group output, save them in an array
my @lines=split '\n', $lsout;

## create a hash to save all groups
# 1. a hash key is a group name
# 2. the hash value contains the members in the group identified by the key
##

print "1. create a hash to save all groups and their members.\n";
print "------------------------------------------------------\n\n";
my %groups =();

for my $line (@lines){

	my @cols = split ':', $line;
	
  # the number of columns must be 4 if the group contains members
	if (scalar @cols == 4){
    my @igroup = split ',',  $cols[-1];
		$groups{$cols[0]} = \@igroup;
	}else{
    # there are empty groups, i.e. contain no member
    my @empty = ();
		$groups{$cols[0]} = \@empty;
	}
	print "$cols[0]: @{$groups{$cols[0]}}\n";
}

## find the number of members in each groups and 
# the number of the largest groups
# !!! there may be more than one maximum groups !!!
print "\n\n2. find the number of members in each group and the number of the largest groups.\n";
print "----------------------------------------------------------------------------------\n\n";
my $max = 0;
for  (keys %groups){

  my $numusers = scalar @{$groups{$_}};

	$max =  ($max > $numusers)? $max : $numusers;
	
	print "Group $_ has $numusers users.\n";
}

print "\n-------------------------------\n";
print "The largest groups have $max users.\n";



## find all largest groups
print "\n\n2. find all largest groups.\n";
print "-------------------------------\n\n";
for  (keys %groups){

  my $numusers = scalar @{$groups{$_}};	
	if ($max == $numusers){	
		print "Largest group $_ has $numusers users.\n";
    print "Its members are: @{$groups{$_}}\n\n";
	}
}





