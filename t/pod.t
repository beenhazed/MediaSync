#!/usr/bin/env perl -T

use 5.012;
use warnings;

use Test::More;

my $TEST_POD_VERSION = '1.14';

eval { use Test::Pod $TEST_POD_VERSION };
if ($@) {
	plan skip_all => "Test::Pod $TEST_POD_VERSION required for testing"
	                 . ' POD';
}

all_pod_files_ok();

