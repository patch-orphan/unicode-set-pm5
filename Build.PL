use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name   => 'Unicode::Set',
    license       => 'Perl_5',
    create_readme => 1,
    configure_requires => {
        'Module::Build'     => '0.3622',
        'Software::License' => 0,
    },
    build_requires => {
        'open'              => 0,
        'English'           => 0,
        'Pod::Man'          => '2.04',
        'Test::Differences' => 0,
        'Test::Exception'   => '0.22',
        'Test::More'        => '0.82',
        'Test::Warn'        => '0.01',
    },
    requires => {
        'perl'             => '5.8.1',
        'namespace::clean' => 0,
        'strict'           => 0,
        'utf8'             => 0,
        'warnings'         => 0,
        'Carp'             => 0,
        'Moo'              => '1.001000',
    },
    meta_merge => {
        resources => {
            repository => 'git://github.com/perl-cldr/unicode-set-pm5.git',
            homepage   => 'https://github.com/perl-cldr/unicode-set-pm5',
            bugtracker => 'https://github.com/perl-cldr/unicode-set-pm5/issues',
        },
    },
);

$builder->create_build_script;
