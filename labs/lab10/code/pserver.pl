#!/usr/bin/env perl
# https://metacpan.org/pod/IO::Socket::INET
# https://metacpan.org/pod/IO::Socket
# https://metacpan.org/release/IO

use utf8;
use strict;
use warnings;
use POSIX;
use IO::Socket::INET;

use constant ENDEBUG => 1;
use constant PORT => '46323';


# creating a listening socket
my $socket = new IO::Socket::INET (
    LocalHost => '0.0.0.0',
    LocalPort => PORT,
    Proto => 'tcp',
    Listen => 1,
    Reuse => 1
);
die "cannot create socket $!\n" unless $socket;
if(ENDEBUG)
{
    print "server waiting for client connection on port: ". PORT ."\n";    
}


while(1)
{
    # waiting for a new client connection
    my $client_socket = $socket->accept();

    # get information about a newly connected client
    my $client_address = $client_socket->peerhost();
    my $client_port = $client_socket->peerport();

    if(ENDEBUG){
        print "connection from $client_address:$client_port\n";
    }
    

    # read up to 1024 characters from the connected client
    my $data = "";
    $client_socket->recv($data, 1024);
    if(ENDEBUG){
        print "received req: $data\n";
    }
    

    # write response data to the connected client
    my $response = "";
    if($data =~ /\d+\.\d+\.\d+\.\d+/)
    {
        $response = sprintf("%d", unpack("N", (pack "C4", split(/\./,"192.168.129.138"))))
    }else{
        $response = join(".", unpack("C4", pack("N", int($data))))
    }
    $response .= "\n";
    $client_socket->send($response);

    # notify client that response has been sent
    shutdown($client_socket, 1);
}

$socket->close();