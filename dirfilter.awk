#!/usr/bin/awk
# Usage: ls -l | awk -f dirfilter.awk -v [target=xxx]

BEGIN {
	if (target == "") {
		target = "txt"
	}
	counter = 0
}
{
	if (NR == 1) {
		target = "." target "$"
	}
}
$0 ~ /^-/ && NF == 9 {
	name = $NF
	if ($8 !~ /:/) {
		year = " (" $8 ")"
	} else {
		year = ""
	}
	if ($0 ~ target) {
		counter++
		printf ("%d.\t%s%s\n", counter,  name, year)
	}
}
