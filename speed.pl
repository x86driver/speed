#!/usr/bin/perl -w

use strict;

my $str;

if (@ARGV != 2) {
	print "Usage: speed.pl [Number of CPU] [1: performance 2: ondemand]\n";
	exit 0;
}

for (0..$ARGV[0]-1) {
	$str = sprintf("/sys/devices/system/cpu/cpu%d/cpufreq/scaling_governor", $_);
	open F, ">$str";
	if ($ARGV[1] == 1) {
		print F "performance";
		printf "Set CPU$_: performance\n";
	} else {
		print F "ondemand";
		printf "Set CPU$_: ondemand\n";
	}
	close F;
}
