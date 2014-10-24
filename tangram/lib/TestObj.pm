#------------------------------------------------------------------------------
# $Id$
# $HeadURL$
#------------------------------------------------------------------------------
package TestObj;

use warnings;
use strict;

#use FindBin;
#use lib "$FindBin::Bin/../../lib";

use base qw( Exporter );
our @EXPORT_OK = qw/ some_funcs to_export /;

our %EXPORT_TAGS = ( ALL => [ @EXPORT_OK ] );

use Data::Dumper;
# Some Data::Dumper settings:
local $Data::Dumper::Useqq  = 1;
local $Data::Dumper::Indent = 3;

local $| = 1;

=head1 NAME

TestObj - The great new TestObj!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use TestObj;

    my $foo = TestObj->new();
    ...

=head1 DESCRIPTION

Write a quick pitch here.

TestObj solves...

=cut

=head1 EXPORT

NONE

=head1 PUBLIC METHODS

new() 

    FUNCTION: Brief description of the function

   ARGUMENTS: Describe Arguments
           
     RETURNS: Describe return value

       NOTES: Any special notes

=cut

sub new {
    return 0;
}

=head1 PRIVATE METHODS

_private_func()

    FUNCTION: Brief description of the function

   ARGUMENTS: Describe Arguments
           
     RETURNS: Describe return value

       NOTES: Any special notes

=cut

sub _private_func{
    return 0;
}

=head1 AUTHOR

Marc Kandel C<< <mkandel at cpan.org> >>

=head1 LICENSE

Copyright 2013 Marc Kandel

=cut

1; # End of Module

__END__

