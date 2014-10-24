#!/usr/local/bin/perl -w
###############################################################################
# $Id:$
# $HeadURL:$
#
# Copyright (c) 2013 mkandel
#
# test.pl
#
###############################################################################

=head1 NAME

test.pl - Runs the tests

=head1 SYNOPSIS

test.pl - This is the main driver for this POC
            
=head1 OPTIONS

=over

=item B<--help|-h>

Print this usage information and exit.

=item B<--debug|-d>

Enable debugging output

=item B<--dryrun|-n>

Enable debugging and disable notifications

=back
         
=head1 DESCRIPTION

C<test.pl> Does everything

=cut

=head1 AUTHOR

Marc Kandel C<< <mkandel at cpan.org> >>

=head1 LICENSE

Copyright 2013 mkandel

=cut

use strict;
use warnings;

use Carp;
use Getopt::Long;
Getopt::Long::Configure qw/bundling no_ignore_case/;
use Data::Dumper;
# Some Data::Dumper settings:
local $Data::Dumper::Useqq  = 1;
local $Data::Dumper::Indent = 3;
use Pod::Usage;

use FindBin;
use lib "$FindBin::Bin/../lib";

use TestObj;

local $| = 1;

my $debug = 0;
my $dryrun  = 0;

GetOptions(
    "help|h"         => sub { pod2usage( 1 ); },
    "debug|d"        => \$debug,
    "dryrun|n"       => sub { $dryrun = 1; $debug = 1; },
);

my $prog = $0;
$prog =~ s/^.*\///;

my $o1 = TestObj->new( { debug => 1, var1 => 'var1', var2 => 'var2' } );
$o1->blah( 'a' );
print Dumper $o1;

my @accessors = qw{ a b blah allowedAccessors };
my $o2 = TestObj->new( { debug => $debug, var1 => 'var1', var2 => 'var2', 'allowedAccessors' => \@accessors } );
$o2->blah( 'a' );
print Dumper $o2;
$o2->allowedAccessors( 'a' );
print Dumper $o2;

__END__

