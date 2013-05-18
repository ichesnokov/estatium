package Estatium::Web::User;
use Mojo::Base 'Mojolicious::Controller';

use Estatium::DB;

# This action will render a template
sub login {
    my $self = shift;


    $self->render(
        json => { success => 1 },
    );
}

1;
