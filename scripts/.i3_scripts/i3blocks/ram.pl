#!/usr/bin/perl

use strict;
use warnings;

my ( $arg_fg, $arg_bg, $arg_prev_widget_bg ) = @ARGV;

sub pango_template
{
	my ( $value, $foreground_color, $background_color, $background_color_prev, $icon, $separator ) = @_;
	return "<span foreground='$background_color' background='$background_color_prev'>$separator</span><span foreground='$foreground_color' background='$background_color'> $icon $value </span>";
}

my @command_output = split( '\n', `free -m` );

my @data = split( ' ', $command_output[1] );

my $total = sprintf( '%.1f', $data[1] / 1024 );
my $free = sprintf( '%.1f', $data[6] / 1024 );

my $display = "$free\G / $total\G";

print pango_template( $display, $arg_fg, $arg_bg, $arg_prev_widget_bg, "", "" );
