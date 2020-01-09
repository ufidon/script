#!/usr/bin/env perl
use warnings;
use strict;

my(@classes, %books);

@classes = ('its250', 'its330', 'its372', 'its352','its450', 'its452');

%books = (
    'its250' =>[
        'Introduction to Computer Security',
        'All in One CISSP Exam Guide'
    ],
    'its330' =>[
        'Operating System Concepts',
    ],
    'its372' =>[
        'Practice of System and Network Administration',
        'DevOps and other Best Practices for Enterprise IT',
        {
            'Unix and Linux System Administration Handbook' =>{
                'edition' => 5,
                'authors' => ['Evi Nemeth', 'Garth Snyder', 'Trent R. Hein', 'Ben Whaley', 'Dan Machin']
            },
            'Microsoft Command Shell' =>{
                'edition' => 3,
                'authors' => ['Lee Holmes',]
            },
            'Windows Powershell Cookbook: The Complete Guide to Scripting' =>{},
            'The Linux Command Line' =>{
                'edition' => 4,
                'authors' => 'William Shotts'
            }
            
        },
    ],
);

my($aref, $href, $ac, $hc);
$aref = \@classes;
$href = \%books;

$ac = @$aref;
$hc = %{$href->{'its372'}[2]};



