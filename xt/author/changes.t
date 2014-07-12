use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use Test::More;

eval 'use Test::CPAN::Changes';
plan skip_all => 'Test::CPAN::Changes not installed; skipping' if $@;

changes_ok();
