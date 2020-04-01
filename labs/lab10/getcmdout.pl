#!/usr/bin/env perl

use strict;
use warnings;

my $lsout = qx"cat /etc/group";
#print $lsout;

my @lines=split '\n', $lsout;

my %groups =();

for my $line (@lines){

	my @cols = split ':', $line;
	
	if (scalar @cols == 4){
		$groups{$cols[0]} = $cols[-1];
	}else{
		$groups{$cols[0]} = 0;
	}
	
}


my $max = 0;
for  (keys %groups){
	print "$_: $groups{$_}\n";
	my @users =  split ',', $groups{$_};
	my $numusers = scalar @users;
	
	$max =  ($max > $numusers)? $max : $numusers;
	
	print "Group $_ has $numusers users.\n";
}

print "The largest group has $max users.\n";

print "-------------------------\n";
for  (keys %groups){
	#print "$_: $groups{$_}\n";
	my @users =  split ',', $groups{$_};
	my $numusers = scalar @users;
	
	if ($max == $numusers){
	
		print "Largest group $_ has $numusers users.\n";
	}
}





