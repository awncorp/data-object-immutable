# ABSTRACT: Immutable Object for Perl 5
package Data::Object::Immutable;

use 5.14.0;
use strict;
use warnings;

use Data::Object;
use Data::Object::Signatures;
use Readonly;

# VERSION

method new ($data) {

  $self = Data::Object->new($data);

  Readonly::Hash %$self   => %$self if UNIVERSAL::isa $self, 'HASH';
  Readonly::Array @$self  => @$self if UNIVERSAL::isa $self, 'ARRAY';
  Readonly::Scalar $$self => $$self if UNIVERSAL::isa $self, 'SCALAR';

  return $self;

}

1;

=encoding utf8

=head1 SYNOPSIS

    use Data::Object::Immutable;

    my $object = Data::Object::Immutable->new([1..9]);

    $object->isa('Data::Object::Array'); # 1
    $object->count; # 9

    $object->[0]++; # fatal ... modification of a read-only value attempted

=head1 DESCRIPTION

Data::Object::Immutable provides a mechanism for making any L<Data::Object>
data type object immutable. An immutable object is an object whose state cannot
be modified after it is created; Immutable objects are often useful because
they are inherently thread-safe, easier to reason about, and offer higher
security than mutable objects.

=cut
