#------------------------------------------------------------------------------
# $Id$
# $HeadURL$
#------------------------------------------------------------------------------
package TestObj;

use warnings;
use strict;
use Carp;

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
    my ( $class, $args ) = @_;
    my $self;

    print Dumper $args;

    KEY:
    foreach my $k ( keys %{ $args } ){
        if ( $k eq 'allowedAccessors' ){
            ACCESSOR:
            foreach my $v ( @{ $args->{ $k } } ){
                print "Processing accessor: '$v'\n" if $args->{ debug };
                #next ACCESSOR if ( $v eq 'allowedAccessors' ); ## Do not allow updating of the allowed accessors!!
                if ( $v eq 'allowedAccessors' ) { ## Do not allow updating of the allowed accessors!!
                    print "Ignoring '$v'!!\n";
                    next ACCESSOR;
                }

                push @{ $self->{ 'allowedAccessors' } }, $v;
            }
        } else {
            $self->{ $k } = $args->{ $k };
        }
    }

    return bless $self, $class;
}

=head1 PRIVATE METHODS

AUTOLOAD() 

    FUNCTION: Catch-all for unknown method calls

   ARGUMENTS: n/a
           
     RETURNS: n/a

       NOTES: Uses allowedAccessors for automatic getter/setter functionality

=cut

sub AUTOLOAD {
    my ( $self, $arg ) = @_;

    our $AUTOLOAD;
    my $call = $AUTOLOAD;
    $call =~ s/.*:://;

    if ( $self->{ 'debug' } ) {
        print "AUTOLOAD: Got argument for '$call': '$arg'\n";
    }

    if ( grep { $_ eq $call } @{ $self->{ 'allowedAccessors' } } ){
        ## We are allowed to AUTOLOAD this attribute
        print "'$call' allowed!!\n" if $self->{ debug };
        if ( $arg ){
            $self->{ $call } = $arg;
        }
        return $self->{ $call };
    } else {
        carp "Trying to set a value for an attribute that is not allowed";
        return undef;
    }
}

=head1 AUTHOR

Marc Kandel C<< <mkandel at cpan.org> >>

=head1 LICENSE

Copyright 2013 Marc Kandel

=cut

1; # End of Module

__END__

