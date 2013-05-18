use utf8;
package Estatium::DB::Result::Estate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Estatium::DB::Result::Estate

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<estate>

=cut

__PACKAGE__->table("estate");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'text'
  is_nullable: 1

=head2 square

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1

=head2 price

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1

=head2 commission

  data_type: 'decimal'
  default_value: 0
  is_nullable: 1

=head2 address

  data_type: 'text'
  is_nullable: 1

=head2 latitude

  data_type: 'float'
  is_nullable: 1

=head2 longtitude

  data_type: 'float'
  is_nullable: 1

=head2 metro_station

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 contact_phone

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 photo

  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "text", is_nullable => 1 },
  "square",
  { data_type => "decimal", default_value => 0, is_nullable => 1 },
  "price",
  { data_type => "decimal", default_value => 0, is_nullable => 1 },
  "commission",
  { data_type => "decimal", default_value => 0, is_nullable => 1 },
  "address",
  { data_type => "text", is_nullable => 1 },
  "latitude",
  { data_type => "float", is_nullable => 1 },
  "longtitude",
  { data_type => "float", is_nullable => 1 },
  "metro_station",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "contact_phone",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
  "photo",
  { data_type => "varchar", default_value => "", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07035 @ 2013-05-18 16:45:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MvMdZXNsuwBy9gdtsCH1yQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
