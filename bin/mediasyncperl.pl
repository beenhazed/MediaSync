#!/usr/bin/env perl

use 5.012;
use XML::Simple qw(:strict);
use Data::Dumper;
use Time::localtime;
use IPC::DirQueue;
use DBD::SQLite;
use Log::Log4perl;
use threads;
use warnings;

our $VERSION = '0.1';
our $packageId = "MediaSyncPerl";

# Steps for the code
# 1. Read config
# 2. Create DirQueue object
# 3. Open processed files SQLite database
# 4. Spawn thread, and loop on it
# 5. Set timer for ftp client connect
# 6. Start ftp client connection on timer end
# 7. Retrieve list of files and directory from source "completeddirectory"
# 8. Compare against processed files
# 9. Check if files in completeddirectory has finished downloading and exist in plex/sonarr
# 9. Queue new files to download, marking each file during transfer to have different extension
# 10. Once file is downloaded, mark file as downloaded, but don't rename yet
# 11. Once the entire directory is complete, rename files with new extensions
# 12. Mark as renamed, and mark as processed

# Read config
my $config = XMLin(undef, ForceArray => 1, KeyAttr => []);
# print Dumper($config);

# Start logger
Log::Log4perl::init_and_watch($config->{logconfigfile},10);
my $logger = Log::Log4perl->get_logger($packageId);



exit(1);
__END__

=head1 NAME

mediasyncperl - One line description of the application's purpose here

=head1 VERSION

This document describes MediaSyncPerl version 0.1

=head1 USAGE

	perl mediasyncperl.pl

=head1 DESCRIPTION

Write a full description of the application and its features here.  Use
subsections (=head2, =head3) as appropriate.

=head1 REQUIRED ARGUMENTS

Write a list of all required arguments on the command line to call this
application.  If these are named arguments, then create a list with an
entry for each one of them.

=over 4

=item -a, --argument [VALUE]

Description of the required argument.

=back

=head1 OPTIONS

Write a list of all optional arguments on the command line to call this
application.  If these are named options, then create a list with an
entry for each one of them.

=over 4

=item -o, --option [VALUE]

Description of the optional argument.

=back

=head1 DIAGNOSTICS

List every single error and warning message that the application can
generate (even the ones that will "never happen"), with a full
explanation of each problem, one or more likely causes, and any
suggested remedies.

=over 4

=item Error Message

Full explanation of the problem, one or more likely causes, and any
suggested remedies.

=back

=head1 EXIT STATUS

A list of all exit status the application can generate and under which
conditions these will happen.

=head1 CONFIGURATION

A full explanation of any configuration system(s) used by the
application, including the names and locations of any configuration
files, and the meaning of any environment variables or properties that
can be set.  These descriptions must also include details of any
configuration language used.

=head1 DEPENDENCIES

A list of all the other modules and programs that this application
relies upon, including any restrictions on versions, and an indication
whether the module is part of the standard Perl distribution, part of
the application's distribution, or must be installed separately.

=head1 INCOMPATIBILITIES

A list of any programs that this application cannot be used in
conjunction with.  This may be due to competition for system or program
resources.

=head1 BUGS AND LIMITATIONS

A list of known problems with the application, together with some
indication whether they are likely to be fixed in an upcoming release.
Also a list of restrictions on the features the application does
provide: data types that cannot be handled, performance issues and the
circumstances in which they may arise, practical limitations on the size
of data sets, special cases that are not (yet) handled, etc.

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-MediaSyncPerl at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=MediaSyncPerl>.  I will be
notified, and then you'll automatically be notified of progress on your
bug as I make changes.

=head1 SEE ALSO

Mention other useful documentation such as the documentation of related
modules or operating system documentation (such as man pages in UNIX),
or any relevant external documentation such as RFCs or standards.

If you have a mailing list set up for your application, mention it here.

If you have a web site set up for your application, mention it here.

=head1 AUTHOR

beenhazed E<lt>beenhazed@gmail.comE<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2016 beenhazed E<lt>beenhazed@gmail.comE<gt>

MediaSyncPerl is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

MediaSyncPerl is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.

