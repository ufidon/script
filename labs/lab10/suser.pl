#!/usr/bin/env perl

use strict;
use warnings;

my $userout = qx"getent passwd ";

my @lines = split '\n', $userout;

my %users = ();

for my $line (@lines){
	my @cols = split ':', $line;
	#push(@users, $cols[0]);
	
	$users{$cols[0]} = [];
}

for (keys %users)
{
	
	my $cmdout = qx"groups $_";
	my @cols = split ' ', $cmdout;
	
	push(@{$users{$_}}, @cols[2..$#cols]);
	
	my $numgroups = scalar @{$users{$_}};
	print "$_: @{$users{$_}} : $numgroups\n";
}






