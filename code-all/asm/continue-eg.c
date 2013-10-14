int loop1()
{
/* $begin continue-for-c */
    /* Example of for loop using a continue statement */
    /* Sum even numbers between 0 and 9 */
    int sum = 0;
    int i;
    for (i = 0; i < 10; i++) {
	if (i & 1)
	    continue;
	sum += i;
    }
/* $end continue-for-c */
    return sum;

}

int loop2()
{
/* $begin continue-while-c */
    /* Naive translation of for loop into while loop */
    /* WARNING: This is buggy code */
    int sum = 0;
    int i = 0;
    while (i < 10) {
	if (i & 1)
	    /* This will cause an infinite loop */
	    continue;
	sum += i;
	i++;
    }
/* $end continue-while-c */
    return sum;
}

int loop32()
{
/* $begin continue-fix-while-c */
    /* Correct translation of for loop into while loop */
    int sum = 0;
    int i = 0;
    while (i < 10) {
	if (i & 1)
	    goto update;
	sum += i;
    update:
	i++;
    }
/* $end continue-fix-while-c */
    return sum;
}

