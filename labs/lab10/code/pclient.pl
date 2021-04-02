#!/usr/bin/env perl
# https://metacpan.org/pod/IO::Socket::INET
# https://metacpan.org/pod/IO::Socket
# https://metacpan.org/release/IO
# https://perldoc.perl.org/perlvar

use utf8;
use strict;
use warnings;
use POSIX;
use IO::Socket::INET;

use constant ENDEBUG => 1;
use constant SERVER => '127.0.0.1';
use constant PORT => '46323';

# create a socket
my $socket = new IO::Socket::INET (
    PeerHost => SERVER,
    PeerPort => PORT,
    Proto => 'tcp',
);
die "cannot connect to server " . SERVER . " $!\n" unless $socket;
if(ENDEBUG){
   print "connected to server " . SERVER . "\n"; 
}


# Enter integer or IPv4 address to send to a server
print "Enter a long integer or IPv4 address: ";
my $req = <STDIN>;
chomp($req);
my $size = $socket->send($req);
if(ENDEBUG){
    print "sent req \"$req\" of length $size\n";
}


# notify server that request has been sent
shutdown($socket, 1);

# receive a response of up to 1024 characters from server
my $response = "";
$socket->recv($response, 1024);

print "received result: $response\n";

$socket->close();