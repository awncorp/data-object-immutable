# ABSTRACT: Immutable Data Type Objects for Perl 5
package Data::Object::Immutable;

use 5.10.0;
use strict;
use warnings;

use Data::Object;
use Readonly;

# VERSION

sub new {
    my $class = shift;
    my $data  = shift;
    my $self  = Data::Object->new($data);
    my $type  = $self->objtype;

    if    ('HASH'  eq $type) { Readonly::Hash   %$self => %$self; }
    elsif ('ARRAY' eq $type) { Readonly::Array  @$self => @$self; }
    else                     { Readonly::Scalar $$self => $$self; }

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
data type object immutable. B<Note: This is an early release available for
testing and feedback and as such is subject to change.>

=cut

