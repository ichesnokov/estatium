package Estatium::Web::User;
use Mojo::Base 'Mojolicious::Controller';

use Digest::SHA qw(sha1_hex);
use Estatium::DB;
use HTTP::Status qw(:constants);

# This action will render a template
sub login {
    my $self = shift;

    my $email    = $self->param('email');
    my $password = $self->param('password');

    my $user
        = Estatium::DB->schema->resultset('User')->find({ email => $email })
        or do {
        $self->res->code(HTTP_NOT_FOUND);
        return $self->render(
            json => { error => { email => { not_found => $email } } });
        };

    if ($user->is_password_valid($password)) {
        my $token = $self->_session_token();
        $user->update({ token => $token });
        $self->session({ token => $token });
        return $self->render(json => { authenticated => 1 });
    }

    $self->res->code(HTTP_UNAUTHORIZED);
    return $self->render(
        json => { error => { password => { invalid => $password } } }
    );
}

sub _session_token {
    return sha1_hex(srand(time) ^ $$);
}

1;
