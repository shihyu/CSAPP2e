break sum
run
print /x (int) sum
print /x $eip
stepi 4
print /x $eip
print /x (int *) $ebp+2
cont
quit
