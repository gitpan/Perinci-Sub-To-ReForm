#!perl

use 5.010;
use strict;
use warnings;

use Test::More 0.98;
use Perinci::Sub::To::ReForm qw(gen_form_spec_from_rinci_meta);

my $meta = {
    v => 1.1,
    summary => 'Summary',
    args => {
        a=>{schema=>'int*', req=>1, pos=>0},
        b=>{schema=>'str'},
    },
};
my $form = {
    v => 1,
    summary => 'Summary',
    args => {
        a=>{schema=>'int*', req=>1, pos=>0},
        b=>{schema=>'str'},
    },
};
my $res = gen_form_spec_from_rinci_meta(meta => $meta);
is($res->[0], 200);
is_deeply($res->[2], $form);

done_testing;
