package Catalyst::Plugin::Message;

use warnings;
use strict;
our $VERSION = '0.01';

sub errmsg {
	my $c = shift;
	my ( $key, $msg ) = @_;
	if ( $key and $msg ){
		$c->stash->{errmsg}{$key} = $msg if ( not defined $c->stash->{errmsg}{$key} );
	}else{
		return scalar keys %{$c->stash->{errmsg}};
	}
}

sub tipmsg {
	my $c = shift;
	my ( $key, $msg ) = @_;
	if ( $key and $msg ){
		$c->stash->{tipmsg}{$key} = $msg if ( not defined $c->stash->{tipmsg}{$key} );
	}else{
		return scalar keys %{$c->stash->{tipmsg}};
	}
}

1;

=pod

=head1 NAME

Catalyst::Plugin::Message - The great new Catalyst::Plugin::Message!

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

 # in your controller
 use Catalyst qw/Message/;
 sub register : Local {
     my ( $self, $c ) = @_;
     if ( $c->req->method eq 'POST' ){
        my $email = $c->req->param('email');
        $c->errmsg( email => 'email can not be empty.' ) unless defined $email;
        $c->errmsg( email => 'email invalid.' ) unless $email =~ /\@/;
        if ( not $c->errmsg ){
        	# save data
        }
     }
     $c->stash->{'template'} = 'register.tpl';
 }

 # register.tpl
 [% errmsg.email %]

=head2 errmsg

pass some error message return to the previous page, every message has a key to indicate which aspect.

you can make more error messages relate to a key, only the first message will save into stash.

=head2 tipmsg

same as errmsg, just make some tips message return.

=head1 AUTHOR

Chunzi, C<< <chunzi at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-catalyst-plugin-message at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Catalyst-Plugin-Message>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Catalyst::Plugin::Message

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Catalyst-Plugin-Message>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Catalyst-Plugin-Message>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Catalyst-Plugin-Message>

=item * Search CPAN

L<http://search.cpan.org/dist/Catalyst-Plugin-Message>

=back

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2006 Chunzi, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut
