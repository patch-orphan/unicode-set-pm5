use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use Test::More tests => 8;
use Test::Differences;
use Unicode::Set;

my $set = Unicode::Set->new;

is $set->set, undef, 'default undefined set';
eq_or_diff [$set->list], [], 'default empty list';

$set->set('[ ]');
is $set->set, '[ ]', 'set accessor';
eq_or_diff [$set->list], [], 'explicit empty set';

$set->set('[ a b c d ]');
eq_or_diff [$set->list], [qw( a b c d )], 'basic set';

$set->set('[ a b c ĉ ]');
eq_or_diff [$set->list], [qw( a b c ĉ )], 'set with wide char';

$set->set('[abcd]');
eq_or_diff [$set->list], [qw( a b c d )], 'set without spaces';

$set->set('[abcĉ]');
eq_or_diff [$set->list], [qw( a b c ĉ )], 'set with wide char without spaces';
