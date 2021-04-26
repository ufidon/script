#!/usr/bin/env perl
use utf8;
use strict;
use warnings;

##### This perl program is used to demonstrate 
# 1. create a file then save information into this file
# 2. open the file and read its contents
#####

## get all users on a Linux machine
my $userout = qx"getent passwd ";
my @lines = split '\n', $userout;
my %users = ();

print "1. create a hash to save all users, each username is a key.\n";
print "-----------------------------------------------------------\n\n";
for my $line (@lines){
	my @cols = split ':', $line;
  my @empty = ();
	$users{$cols[0]} = \@empty;
}

## create a file named records.txt
print "2. create a file named records.txt to save the statistics of all users.\n";
print "-----------------------------------------------------------------------\n\n";
open my $fh, "+>", "records.txt";

## find the groups and the number of groups each user joined
print "3. find the groups and the number of groups each user joined.\n";
print "-------------------------------------------------------------\n\n";
for (keys %users)
{
	
	my $cmdout = qx"groups $_";
	my @cols = split ' ', $cmdout;
	
	push(@{$users{$_}}, @cols[2..$#cols]);
	
	my $numgroups = scalar @{$users{$_}};
  
  ## save the number of groups each user joined in records.txt
	print $fh "$_: @{$users{$_}} : $numgroups\n";
}

## close the file after writing
close $fh;

## open file records.txt for reading
print "4. open file records.txt for reading.\n";
print "-------------------------------------\n\n";
open  $fh, "<", "records.txt";

## read a single line from the file  records.txt
print "5. read a single line, the first line from the file  records.txt.\n";
print "-----------------------------------------------------------------\n";
my $singleline = <$fh>;
print $singleline;



## read all lines from the file  records.txt
print "\n\n6. read all lines from the file  records.txt.\n";
print "-------------------------------------------------\n";
print "user name : list of groups the user joined : number of groups the user joined\n";

seek $fh, 0, 0;
my @alllines = <$fh>;
print @alllines;

## close the file after reading
close $fh;






