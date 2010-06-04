#!/usr/bin/perl -w

use strict;

my $str;

if (@ARGV != 1) {
	print "Usage: speed.pl [Number of CPU]\n";
	exit 0;
}

for (0..$ARGV[0]-1) {
	$str = sprintf("/sys/devices/system/cpu/cpu%d/cpufreq/scaling_governor", $_);
	print $str, "\n";
	open F, ">$str";
	print F "performance";
	close F;
}
