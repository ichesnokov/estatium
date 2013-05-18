package Estatium::Web::Estate;
use Mojo::Base 'Mojolicious::Controller';

use Estatium::DB;

sub schema { Estatium::DB->schema }

# Create an estate object
sub create {
    my $self = shift;

    eval {
        $self->schema->resultset('Estate')->create(
            {
                map { $_ => $self->param($_) } qw(
                    name square price commission address
                    latitude longitude metro_station
                    contact_phone
                )
            }
        );
    } or return $self->render(
        status => HTTP_INTERNAL_SERVER_ERROR,
        json   => { error => $@ }
    );

    return $self->render(
        status => HTTP_CREATED,
        json   => { success => 1 },
    );
}

sub get {
    my $self = shift;
    ...;
}

sub search {
    my $self = shift;
    ...;
}

1;
