#!/usr/bin/gawk -f
#NB: it removes all leading/trailing tabs and NBSP
#TODO: faire une option -v n=y pour ajouter la trailing newline
BEGIN {
	if (w == "") {
		print "Usage: $ this -v w=[0-9]+ <stdin\nDefaulting to w=79." > "/dev/stderr"
		#exit 1
		w = 79
	}
}
{ 
	
        s = $0 ; gsub(/^[[:space:] ]+|[[:space:] ]+$/, "", s);
        pad = int( (w - length(s)) / 2 );
        if (pad > 0)    printf( "%*s%s", pad, "", s ); 
	if (NR > 1) 	printf "\n"
}
