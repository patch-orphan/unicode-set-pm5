use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use Test::More;

eval 'use Test::Pod 1.00';
plan skip_all => 'Test::Pod 1.00 not installed; skipping' if $@;

all_pod_files_ok();
