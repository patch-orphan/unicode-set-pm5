use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use Test::More tests => 5;
use Test::Differences;
use Unicode::Set;

my $set = Unicode::Set->new;

is $set->set, undef, 'default undefined set';
eq_or_diff [$set->list], [], 'default empty list'; 

$set->set('[ a b c d ]');
is $set->set, '[ a b c d ]', 'set accessor';
eq_or_diff [$set->list], [qw( a b c d )], 'basic set'; 

$set->set('[ a b c ĉ ]');
eq_or_diff [$set->list], [qw( a b c ĉ )], 'set with wide char';
