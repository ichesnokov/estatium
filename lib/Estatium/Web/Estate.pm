package Estatium::Web::Estate;
use Mojo::Base 'Mojolicious::Controller';

use Estatium::DB;
use HTTP::Status qw(:constants);

sub schema { Estatium::DB->schema }
sub estate_rs { shift->schema->resultset('Estate') }

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

        $self->estate_rs->create($estate_hash);
    } or return $self->render(
        status => HTTP_INTERNAL_SERVER_ERROR,
        json   => { error => $@ }
    );

    return $self->render(
        status => HTTP_CREATED,
        json   => { success => 1 },
    );
}

# XXX: I'm not sure that it works
sub list {
    my $self = shift;

    my $page = $self->param('page') || 0;
    my $rows = $self->param('rows') || 10;

    my $rs = $self->estate_rs;
    $rs = ->search->page($page);
    $rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
    return $self->render(
        json => {
            estates => [ $rs->all ],
            page        => $page,
            total_pages => $rs->pager->last_page,
        },
    );
}

sub get {
    my $self = shift;

    my $estate_id = $self->param('estate_id');
    $self->app->log->debug("estate id: $estate_id");

    my $rs = $self->estate_rs;
    $rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
    my $estate = $rs->find($estate_id)
        or return $self->render(
            status => HTTP_NOT_FOUND,
            json   => { estate => { not_found => $estate_id } },
        );
    $self->render(json => $estate);
}

sub search {
    my $self = shift;
    ...;
}

1;
