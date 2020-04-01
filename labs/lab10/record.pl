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

open my $fh, "+<", "records.txt";
for (keys %users)
{
	
	my $cmdout = qx"groups $_";
	my @cols = split ' ', $cmdout;
	
	push(@{$users{$_}}, @cols[2..$#cols]);
	
	my $numgroups = scalar @{$users{$_}};
	#print $fh "$_: @{$users{$_}} : $numgroups\n";
}

#while(<$fh>)
#{
#		print "$_";
#}

my $singleline = <$fh>;
print $singleline;

print "\n-------------------------------\n";

seek $fh, 0, 0;

my @alllines = <$fh>;
print @alllines;

close $fh;






