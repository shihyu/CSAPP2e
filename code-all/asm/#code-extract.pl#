#!/usr/bin/perl

# Extract addresses from disassembly and execution of program "prog"
$dir = ".";
$progname = "prog";
$prog = "$dir/$progname";
$function = "switch_prob";

# First use gdb to disassemble function:

$file1 = "extract.gdb";
$file1out = "prog.out";
open FILE1, ">$file1" || die "Couldn't open $file1 to write\n";

print FILE1 "disassemble $function\nquit\n";
close FILE1;

system "gdb $prog -x $file1 > $file1out";

open XFILE, "$file1out" || die "Couldn't open $file1out to read\n";

$address = "NONE";
while (<XFILE>) {
    $line = $_;
    chomp $line;
#    print ("Looking at line '$line'\n");
    if ($line =~ /jmp[ ]+\*(0x[0-9a-fA-F]+)/) {
	$address = $1;
#	print "Found address $address\n";
    }
}

close XFILE;

if ($address eq "NONE") {
    die "Couldn't find address of jump table\n";
}

system "rm -f $file1 $file1out\n";

$file2 = "jt.gdb";
$file2out = "switchbody-ans.jt";
open FILE2, ">$file2" || die "Couldn't open file $file2\n";

$gdbcmd = "x/$jtsize" . "w $address";

print FILE2 "$gdbcmd\nquit\n";

close FILE2;

system "gdb $prog -x $file2 > $file2out\n";

# Finally print output file
print "\\newcommand{\\jtaddr}{\\texttt{$address}}\n";

open JTFILE, $file2out || die "Couldn't open file $file2out\n";

$i = 0;
@cmds = ("jtlinea", "jtlineb",  "jtlinec", "jtlined");

while (<JTFILE>) {
   $line = $_;
   chomp $line;
   if ($line =~ "0x[a-fA-F0-9]+:") {
       $line =~ s/\t/    /g;
       print "\\newcommand{\\$cmds[$i]}{$line}\n";
       $i = $i+1;
   }
}

system "rm -f $file2 $file2out\n";
