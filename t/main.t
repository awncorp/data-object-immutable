use Test::More;

use_ok 'Data::Object::Immutable';

my $error  = qr/modification of a read-only value/i;
$object = '';

# array
ok $object = Data::Object::Immutable->new([1..9]);
ok $object->isa('Data::Object::Array');
is $object->count, 9;
ok !eval { $object->set(0,1) };
like $@, $error;
ok !eval { $object->[0]++ };
like $@, $error;

# hash
ok $object = Data::Object::Immutable->new({1..8});
ok $object->isa('Data::Object::Hash');
is $object->keys->count, 4;
ok !eval { $object->set(1,2) };
like $@, $error;
ok !eval { $object->{1}++ };
like $@, $error;

# string
ok $object = Data::Object::Immutable->new('abcedfghi');
ok $object->isa('Data::Object::String');
is $object->length, 9;
ok !eval { $object->uppercase };
like $@, $error;
ok !eval { $$object = uc $$object } or diag $object;
like $@, $error;

# number
ok $object = Data::Object::Immutable->new(1000);
ok $object->isa('Data::Object::Number');
ok !eval { $$object++ };
like $@, $error;

# foreign
ok $object = Data::Object::Immutable->new(bless {}, 'main');
ok $object->isa('main');
ok !eval { $object->{0} = 1 };
like $@, $error;

ok 1 and done_testing;
