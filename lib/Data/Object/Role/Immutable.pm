# ABSTRACT: Immutable Object Role for Perl 5
package Data::Object::Role::Immutable;

use 5.14.0;
use strict;
use warnings;

use Data::Object;
use Data::Object::Role;
use Data::Object::Signatures;
use Data::Object::Immutable;
use Readonly;

# VERSION

around BUILD => fun ($orig, $self, @args) {

    my $result = $self->$orig(@args);

    return Data::Object::Immutable->new($result);

};

1;

=encoding utf8

=head1 SYNOPSIS

    package Checkout;

    use Data::Object::Class;

    with 'Data::Object::Role::Immutable';

    has cart => ( is => 'rw' );

    1;

=head1 DESCRIPTION

Data::Object::Role::Immutable provides a mechanism for making any object
derived from a L<Data::Object> based class immutable. An immutable object is an
object whose state cannot be modified after it is created; Immutable objects
are often useful because they are inherently thread-safe, easier to reason
about, and offer higher security than mutable objects.

=cut
