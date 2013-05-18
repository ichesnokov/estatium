package Estatium::Web;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
    my $self = shift;

    $app->secret('nvlsjknlkj12n4-12897u098hn');

    # Router
    my $r = $self->routes;
    $r->post('/user/login')->to('user#login');
}

1;
