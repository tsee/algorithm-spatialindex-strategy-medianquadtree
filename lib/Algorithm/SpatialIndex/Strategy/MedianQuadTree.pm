package Algorithm::SpatialIndex::Strategy::MedianQuadTree;
use 5.008008;
use strict;
use warnings;
use Carp qw(croak);

our $VERSION = '0.01';

use Algorithm::SpatialIndex::Strategy::QuadTree qw(:all);
use parent 'Algorithm::SpatialIndex::Strategy::QuadTree';

use Statistics::CaseResampling qw(median);

sub _node_split_coords {
  my ($self, $node, $bucket, $coords) = @_;
  my $items = $bucket->items;
  my $xmedian = median([map $_->[XI()], @$items]);
  my $ymedian = median([map $_->[YI()], @$items]);

  my $width  = ($coords->[XLOW()] + $coords->[XUP()])/2;
  my $height = ($coords->[XLOW()] + $coords->[XUP()])/2;

  return($xmedian, $ymedian);
}

1;
__END__

=head1 NAME

Algorithm::SpatialIndex::Strategy::MedianQuadTree - QuadTree splitting on bucket medians

=head1 SYNOPSIS

  use Algorithm::SpatialIndex;
  my $idx = Algorithm::SpatialIndex->new(
    strategy => 'MedianQuadTree',
  );

=head1 DESCRIPTION

A quad tree implementation.

=head1 METHODS

=head1 SEE ALSO

L<Algorithm::QuadTree>

=head1 AUTHOR

Steffen Mueller, E<lt>smueller@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Steffen Mueller

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.

=cut
