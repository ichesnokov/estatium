package Estatium::Web::Estate;
use Mojo::Base 'Mojolicious::Controller';

use Estatium::DB;
use HTTP::Status qw(:constants);

sub schema { Estatium::DB->schema }

# Create an estate object

=head3 POST /estate

    In: \%estate
        name - required
        square - required
        price
        commission
        address
        metro_station
        latitude
        longtitude
        contact_phone - required

    Out: \%result
        success - on success
        error   - on error

=cut

sub create {
    my $self = shift;

    eval {
        my $estate_hash = $self->req->json;
        delete $estate_hash->{id}; # Just in case

        $self->schema->resultset('Estate')->create($estate_hash)
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
