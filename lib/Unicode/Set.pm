package Unicode::Set;

use v5.8.1;
use utf8;

use Moo;
use namespace::clean;

our $VERSION = '0.00_01';

has set => (
    is => 'rw',
);

sub list {
    my ($self) = @_;
    my $set = $self->set;

    return () unless defined $set;

    for ($set) {
        s{ ^ \[ \s* }{}x;
        s{ \s* \] $ }{}x;
    }

    my @list = map { m{ ^ (.) - (.) $ }x ? _range($1, $2) : $_ }
               map { split m{ (?<! - ) (?! - ) }x }
               split m{ \s+ }x, $set;

    return @list;
}

sub _range {
    my ($start, $end) = map { ord } @_;

    return map { chr } $start .. $end;
}

1;

__END__

=encoding UTF-8

=head1 NAME

Unicode::Set - Set of Unicode characters and character strings

=head1 VERSION

This document describes Unicode::Set v0.00_1.

=head1 SYNOPSIS

    use Unicode::Set;

    $set = Unicode::Set->new;

=head1 DESCRIPTION

XXX

=head2 Attributes

=over

=item set

XXX

=back

=head2 Methods

=over

=item list

XXX

=back

=head1 SEE ALSO

=over

=item * L<UTS #35 Unicode LDML: Unicode Sets|http://www.unicode.org/reports/tr35/#Unicode_Sets>

=item * L<ICU User Guide: UnicodeSet|http://userguide.icu-project.org/strings/unicodeset>

=item * L<ICU4C: UnicodeSet Class|http://icu-project.org/apiref/icu4c/classicu_1_1UnicodeSet.html>

=item * L<ICU4J: UnicodeSet Class|http://www.icu-project.org/apiref/icu4j/com/ibm/icu/text/UnicodeSet.html>

=back

=head1 AUTHOR

Nick Patch <patch@cpan.org>

This project is brought to you by L<Perl CLDR|http://perl-cldr.github.io/>.

=head1 COPYRIGHT AND LICENSE

© 2014 Nick Patch

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
