package ACNH::Data::Tools::Digest::SHA;

use strict;
use warnings;

use Digest::SHA ();

sub hash {
    my $content = shift;
    return Digest::SHA::sha256( $content );
}

sub compare {
    my $one = shift;
    my $two = shift;

    die "compare requires 2 scalars to compare"
        unless $one && $two;

    my $one_digest = hash( $one );
    my $two_digest = hash( $two );

    return $one_digest eq $two_digest;
}

1;

__END__

=pod

=head1 NAME

ACNH::Data::Tools::Digest::SHA - SHA hash sugar

=head1 SYNOPSIS

 use ACNH::Data::Tools::Digest::SHA;

=head1 DESCRIPTION

C<ACNH::Data::Tools::Digest::SHA>

=head1 SUBROUTINES

=over

=item compare

Compare hash sums of 2 scalars.

Returns true value if the hashes match.

=item hash

Compute the hash of a scalar.

Returns the hash.

=back

=head1 AUTHOR

Blaine Motsinger C<blaine@renderorange.com>

=cut
