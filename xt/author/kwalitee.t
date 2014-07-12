use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use Test::More;

# Moo enables strictures
eval 'use Test::Kwalitee tests => [qw( -use_strict )]';
plan skip_all => 'Test::Kwalitee not installed; skipping' if $@;
