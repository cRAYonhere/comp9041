// Display command line arguments, one per line
#include <stdio.h>
int main(int argc, char *argv[]) {
    int i;
    printf("#args  = %d\n", argc-1);
    for (i = 1; i < argc; i++)
        printf("arg[%d] = \"%s\"\n", i, argv[i]);
    return 0;
}
