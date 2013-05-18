package Estatium::Web;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
    my $self = shift;

    srand;
    $self->secret('nvlsjknlkj12n4-12897u098hn');

    # Router
    my $r = $self->routes;
    $r->post('/user/login')->to('user#login');

    # Operations with estates
    $r->post('/estate')->to('estate#create');
    $r->get('/estate')->to('estate#list');
    $r->get('/estate/:estate_id')->to('estate#get');
    $r->post('/estate/search')->to('estate#search');
}

1;
