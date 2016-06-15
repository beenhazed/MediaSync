#!/usr/bin/env perl -T

use 5.012;
use warnings;

use Test::More;

eval { require Test::Perl::Critic }
	or plan skip_all => 'Test::Perl::Critic required for testing PBP'
	                    . ' compliance';

Test::Perl::Critic::all_critic_ok();

