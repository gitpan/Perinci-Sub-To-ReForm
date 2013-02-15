package Perinci::Sub::To::ReForm;

use 5.010;
use strict;
use warnings;
#use Log::Any '$log';

use Data::Clone;
#use Data::Sah;

use Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(gen_form_spec_from_rinci_meta);

our $VERSION = '0.01'; # VERSION

our %SPEC;

$SPEC{gen_form_spec_from_rinci_meta} = {
    v => 1.1,
    summary => 'Generate ReForm function specification from '.
        'Rinci function metadata',
    description => <<'_',


_
    args => {
        meta => {
            schema => ['hash*'],
            req => 1,
        },
    },
    "_perinci.sub.wrapper.validate_args" => 0,
};

sub gen_form_spec_from_rinci_meta {
    my %args = @_;
    my $meta = $args{meta}; my $_sahv_dpath = []; my $arg_err; ((defined($meta)) ? 1 : (($arg_err //= (@$_sahv_dpath ? '@'.join("/",@$_sahv_dpath).": " : "") . "Required input not specified"),0)) && ((ref($meta) eq 'HASH') ? 1 : (($arg_err //= (@$_sahv_dpath ? '@'.join("/",@$_sahv_dpath).": " : "") . "Input is not of type hash"),0)); if ($arg_err) { return [400, "Invalid argument value for meta: $arg_err"] } # VALIDATE_ARG

    # XXX schema
    $meta->{v} == 1.1 or return [400, "meta must have v=1.1"];

    # temporarily it's all the same, except the version
    my $form = clone($meta);
    $form->{v} = 1;

    [200, "OK", $form];
}

1;
#ABSTRACT: Generate ReForm function specification from Rinci function metadata


__END__
=pod

=head1 NAME

Perinci::Sub::To::ReForm - Generate ReForm function specification from Rinci function metadata

=head1 VERSION

version 0.01

=head1 SYNOPSIS

 use Perinci::Sub::To::ReForm qw(gen_form_spec_from_rinci_meta);

 my $res = gen_form_spec_from_rinci_meta(meta=>$meta, ...);

=head1 DESCRIPTION

=head1 FAQ

=head1 SEE ALSO

L<Rinci::function>

L<ReForm>

=head1 FUNCTIONS


=head2 gen_form_spec_from_rinci_meta() -> [status, msg, result, meta]

No arguments.

Return value:

Returns an enveloped result (an array). First element (status) is an integer containing HTTP status code (200 means OK, 4xx caller error, 5xx function error). Second element (msg) is a string containing error message, or 'OK' if status is 200. Third element (result) is optional, the actual result. Fourth element (meta) is called result metadata and is optional, a hash that contains extra information.

=head1 AUTHOR

Steven Haryanto <stevenharyanto@gmail.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Steven Haryanto.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

