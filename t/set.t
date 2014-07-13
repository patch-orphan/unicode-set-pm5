use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use charnames qw( :full );
use Test::More tests => 19;
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

$set->set('[ ab cd ]');
eq_or_diff [$set->list], [qw( a b c d )], 'set with and without spaces';

$set->set("[ab\t\r\n\f\N{NO-BREAK SPACE}\N{IDEOGRAPHIC SPACE}cd]");
eq_or_diff [$set->list], [qw( a b c d )], 'set with mixed whitespace';

$set->set('[a-d]');
eq_or_diff [$set->list], [qw( a b c d )], 'set is range';

$set->set('[a-cĉ]');
eq_or_diff [$set->list], [qw( a b c ĉ )], 'set includes range';

$set->set('[а-г]');
eq_or_diff [$set->list], [qw( а б в г )], 'set range with Cyrillic';

$set->set('[😀-😃]');
eq_or_diff [$set->list], [qw( 😀 😁 😂 😃 )], 'set range with Emoji';

$set->set('[ a-c {ch} d ]');
eq_or_diff [$set->list], [qw( a b c ch d )], 'set with multichar string (space)';

$set->set('[a-c{ch}d]');
eq_or_diff [$set->list], [qw( a b c ch d )], 'set with multichar string (no space)';

$set->set('[ a-c \\u0109 d ]');
eq_or_diff [$set->list], [qw( a b c ĉ d )], 'set with 4-hex escaped char (space)';

$set->set('[a-c\\u0109d]');
eq_or_diff [$set->list], [qw( a b c ĉ d )], 'set wih 4-hex escaped char (no space)';

$set->set('[ \\U0001F600 ]');
eq_or_diff [$set->list], ['😀'], 'set with 8-hex escaped char';
