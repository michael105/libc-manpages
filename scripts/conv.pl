#!/bin/perl
# quick hack.
# read manpagenames from stdin, debug to stdout, 
# write formatted output to stderr
#
# usage e.g. cat manpages.txt | conv.pl 2>man-names.txt
#




sub conv{
		my $fn = shift;

		my $l;
		my @n;
		my $desc;

		open F,$fn;
		do {
				$l=<F> or return;
		} while ( ! ($l =~ /^.sh NAME/i) );

		print "ln:$l";

		$l=<F> or die;

		do {
				print "l:$l";

				if ( $l=~ /^.nd (.*)/i ){
						$desc = $1;
				} elsif ( $l=~ /^.nm (\S*)/i ){
						push @n,$1;
				} elsif ( $l =~ /(.*)\\- (.*)/ ){
						$desc=$2;
						push @n, split( " ", $1 );
						map { $_ =~ s/,// } @n;
				} elsif ( $l =~ /^\\\(em (.*)/ ){
						$desc = $1;
				} elsif ( $l=~ /^\\/ || $l=~ /^function/ || $l=~/^\(/) { # filter out 
				} else {
						$l=~ s/^\s*//;
						$l=~ s/,$//;
						#$l=~ s/\s.*//;

						push @n, split( " ", $l );
				}

				$l=<F> or die;
		} while ( ! ( $l =~ /^.sh/i ) );


		print "ln:$l";

		print "desc: $desc\n";

		#print "\n names:\n",join("\n",@n); 

		$fn =~ /^..(.*)\/(.*)/;
		$fn =~ s/^\.\///;
		my $p = $1;
		my $f = $2;

		my $ret="";

		print "  ===\n";

		# output formatting
		if ( 0 ){
		foreach my $name ( @n ){
				printf "%-23s %-12s %s\n", $fn, $name,$desc;
				$ret .= sprintf "%-23s %-12s %s\n", $fn, $name,$desc;
		}
}	else {
		 printf STDERR "%-32s %s\n", $fn, join(",",@n);
		 #printf STDERR "%-23s %-12s - %s\n", $fn, join(",",@n),$desc;
 }

		close F;
		return $ret;
}



foreach my $f (<>){
		chomp $f;
		conv($f);
}


