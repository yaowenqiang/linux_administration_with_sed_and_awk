#!/bin/awk -f 
BEGIN {
  #FS=":";
  #printf "%4s%20s%6s\n", "Num:", "Username", "UID";
  COUNT=0
}
!(/Never logged in/ || /^Username/ || /^root/ ) {
  COUNT++;
  if (NF == 8)
    printf "%8s %2s %3s %4s\n",$1 ,$5, $4, $8;
  else
    printf "%8s %2s %3s %4s\n",$1 ,$6, $5, $9;
}

END {
  print "==================="
  print "Total number of users processed: ", COUNT;
}

