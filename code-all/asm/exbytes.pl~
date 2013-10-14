#!/usr/bin/perl
#!/usr/local/bin/perl

use Getopt::Std;

#
# usage - print help message and terminate
#
sub usage 
{
    printf STDERR "$_[0]\n";
    printf STDERR "Usage: $0 [-h] -b <trimbyte>\n";
    printf STDERR "Options:\n";
    printf STDERR "  -h            Print this message\n";
    printf STDERR "  -b <trimbyte> Trim trailing copies of specified byte\n";
    die "\n";
}

getopts('hb:');
if ($opt_h) {
    usage();
}

# Extract hex bytes from disassembled file
$bcount = 0;

@bytes = ();

while (<>)
{
    $line = $_;
    chomp $line;
    if ($line =~ /[ ]*[0-9a-f]+:[ \t]+(([0-9a-f][0-9a-f][ ])*[0-9a-f][0-9a-f])/) {
	@morebytes = split (/ /, $1);
	foreach $b (@morebytes) {
	    $bytes[$bcount] = $b;
	    $bcount++;
	}
    }
}

if ($opt_b) {
  # Trim trailing copies of specified byte
    while ($bytes[$bcount-1] eq $opt_b) {
	$bcount--;
    }
}

foreach ($i = 0; $i < $bcount; $i++) {
    print "$bytes[$i] ";
}








