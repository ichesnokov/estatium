package Estatium::Web;
use Mojo::Base 'Mojolicious';

use Estatium::DB;

# This method will run once at server start
sub startup {
    my $self = shift;

    srand;
    $self->secret('nvlsjknlkj12n4-12897u098hn');

    # Router
    my $r = $self->routes;
    $r->post('/user/login')->to('user#login');

    my $auth = $r->bridge('/')->to(
        cb => sub {
            my $c = shift;

            # Authenticate all API routes except /login
            return 1
                if $c->req->url->path eq '/login'
                || $c->session->{token}
                && Estatium::DB->schema->resultset('User')->find(
                    { token => $c->session->{token} }
                );
            $self->render(json => { login => { failed => 1 } });
            return;
        }
    );

    # Operations with estates
    $r->post('/estate')->to('estate#create');
    $r->get('/estate')->to('estate#list');
    $r->get('/estate/:estate_id')->to('estate#get');
    $r->post('/estate/search')->to('estate#search');
}

1;
