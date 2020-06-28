package ACNH::Data::Tools::Config;

use strict;
use warnings;

use FindBin      ();
use Cwd          ();
use Config::Tiny ();

our $VERSION = '0.001';

sub get {
    my $class = shift;

    my $self = {
        'project_dir' => Cwd::realpath( $FindBin::RealBin . '/../' ),
    };

    bless $self, $class;

    my $config = $self->load_config();

    foreach my $key ( keys %{$config} ) {
        $self->{$key} = $config->{$key};
    }

    return $self;
}

sub load_config {
    my $self = shift;

    my $rc = $self->{project_dir} . '/.acnh-data-tools.rc';

    unless ( -f $rc ) {
        die "$rc is not present";
    }

    return Config::Tiny->read($rc);
}

1;

__END__

=pod

=head1 NAME

ACNH::Data::Tools::Config - load and return the project config

=head1 SYNOPSIS

 use ACNH::Data::Tools::Config;
 my $config = ACNH::Data::Tools::Config->get();

=head1 DESCRIPTION

C<ACNH::Data::Tools::Config> loads the project config from the project dir location and returns
it to the caller.

=head1 METHODS

=over

=item get

Load the config and return an C<ACNH::Data::Tools::Config> object.

=back

=head1 CONFIGURATION

C<ACNH::Data::Tools::Config> takes configuration options from the C<.acnh-data-tools.rc>
file within the project directory.

=head1 AUTHOR

Blaine Motsinger C<blaine@renderorange.com>

=cut
