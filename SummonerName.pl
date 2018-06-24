#!/usr/bin/perl
use strict;
use warnings;

use LWP;
use Cpanel::JSON::XS;
use Data::Dumper;

print "What is your summoner name? \n";
#variables, $ - single value, @ - array, % - multiple values

my $name = readline STDIN;
chomp($name);
my $code = ''; # your DEVELOPMENT API KEY goes here
my $url = 'https://na1.api.riotgames.com/lol/summoner/v3/summoners/by-name/'.$name.$code;

print $url . "\n";

my $ua = LWP::UserAgent->new;

my $json = $ua->get($url);

die $json->status_line unless $json->is_success;


my $json_data = $json->decoded_content;
my $decoded = decode_json($json_data);

print "Summoner Name" . $name . "\n";
print "Summoner ID: " . $decoded->{'id'} . "\n";
print "Account ID: " .  $decoded->{'accountId'} . "\n";
print "Summoner Level: ". $decoded->{'summonerLevel'} . "\n";