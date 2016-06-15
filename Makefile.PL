#!/usr/bin/env perl

use 5.012;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
	NAME                => 'mediasyncperl',
	AUTHOR              => 'beenhazed <beenhazed@gmail.com>',
	VERSION_FROM        => 'bin/mediasyncperl.pl',
	ABSTRACT_FROM       => 'bin/mediasyncperl.pl',
	PREREQ_PM => {
		'Test::More' => 0,
		'version'    => 0,
	},
	EXE_FILES           => ['bin/mediasyncperl.pl'],
	dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
	clean               => { FILES => 'mediasyncperl-*' },
);

