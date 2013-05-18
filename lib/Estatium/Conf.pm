package Estatium::Conf;
use common::sense;
use lib::abs;

read_config();

my $config;
sub read_config {
    my $config_file = lib::abs::path('../../conf/conf.pl');
    say "config: $config_file";
    $config = do $config_file;
}

=item config

Returns the full config hash.

=cut

sub config { $config }

=item get

Get a config key.
    In: $key
    Out: $value - configuration value for this key

=cut

sub get {
    my $key = shift;
    return $config->{$key};
}

1;
