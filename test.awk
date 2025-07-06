BEGIN {
  print "This is the start"
}
{
  print $0;
}

END {
  print "This is the end"
}
