use utf8;
package Estatium::DB::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Estatium::DB::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<user>

=cut

__PACKAGE__->table("user");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 password_hash

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 role_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 first_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 last_name

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 token

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "password_hash",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "role_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "first_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "last_name",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "token",
  { data_type => "varchar", is_nullable => 1, size => 40 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<email>

=over 4

=item * L</email>

=back

=cut

__PACKAGE__->add_unique_constraint("email", ["email"]);

=head2 C<token>

=over 4

=item * L</token>

=back

=cut

__PACKAGE__->add_unique_constraint("token", ["token"]);

=head1 RELATIONS

=head2 role

Type: belongs_to

Related object: L<Estatium::DB::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "role",
  "Estatium::DB::Result::Role",
  { id => "role_id" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-18 20:42:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0TNqEVmdQ4tNBbJTdFYvyw

use Estatium::Conf;
use Digest::SHA qw(sha1_hex);

sub is_password_valid {
    my ($self, $password) = @_;

    return $self->password_hash eq $self->get_password_hash($password);
}

sub get_password_hash {
    my ($self, $password) = @_;

    return sha1_hex($password, Estatium::Conf::get('password_salt'));
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
