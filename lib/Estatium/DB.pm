use utf8;
package Estatium::DB;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces;


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-18 14:47:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NqStz6qikQuX3fCecOTMNg

# Version for DBIx::Class::DeploymentHandler
our $VERSION = 3;

use Estatium::Conf;

my $schema;

=head2 schema

Returns a connected schema for I<estatium> db.

=cut

sub schema {
    my ($class) = @_;
    return $schema ||= $class->_get_connected_schema();
}

sub _get_connected_schema {
    my ($class) = @_;

    my $db_config = Estatium::Conf::get('db');
    return $class->connect(
        @{ $db_config }{qw(dsn user password)},
        {
            AutoCommit => 1,
            RaiseError => 1,
        },
    );
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
