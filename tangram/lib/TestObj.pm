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

use Tangram;
use Tangram::Driver::SQLite;

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

A better persistent object!!

=cut

=head1 EXPORT

NONE

=head1 PUBLIC METHODS

=item

new() 

    FUNCTION: Brief description of the function

   ARGUMENTS: Describe Arguments
           
     RETURNS: Describe return value

=cut

sub new {
    my ( $class, $args ) = @_;
    my $self;

    KEY:
    foreach my $k ( keys %{ $args } ){
        if ( $k eq 'allowedAccessors' ){
            ACCESSOR:
            foreach my $v ( @{ $args->{ $k } } ){
                print "Processing accessor: '$v'\n" if $args->{ debug };
                #next ACCESSOR if ( $v eq 'allowedAccessors' ); ## Do not allow updating of the allowed accessors!!
                if ( $v eq 'allowedAccessors' ) { ## Do not allow updating of the allowed accessors!!
                    print "Ignoring '$v'!!\n" if $args->{ 'debug' };
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

=item

save() 

    FUNCTION: Saves an object

   ARGUMENTS: none
           
     RETURNS: Object identifier, -1 on error

=cut

sub save {
    my $self = shift;

    my $oid = -1;

    return $oid;
}

=item

find() 

    FUNCTION: Searches saved objects

   ARGUMENTS: Search criteria
           
     RETURNS: Object identifier for matching object(s)

=cut

sub find {
    my $self = shift;
    my $oid = -1;

    return $oid;
}

=item

load() 

    FUNCTION: Load a saved object

   ARGUMENTS: Object identifier
           
     RETURNS: saved object or undef if object cannnot be found

=cut

sub load {
    my $self = shift;
    my $obj = undef;

    return $obj;
}

=head1 PRIVATE METHODS

=item

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
        croak "Trying to set a value for an attribute that is not allowed";
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

