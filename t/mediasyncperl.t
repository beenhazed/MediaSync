#!/usr/bin/env perl -T

use 5.012;
use warnings;

use Test::More tests => 1;

my $bin = 'bin/mediasyncperl.pl';

$ENV{'PATH'} =~ /(.*)/;
$ENV{'PATH'} = $1;

is(system("perl -c $bin 2> /dev/null"), 0, "$bin compiles");

