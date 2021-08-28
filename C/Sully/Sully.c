#include <stdlib.h>
#include <stdio.h>
int n = 5;
int main(){
char *fname = "Sully_%1$i.c";
char *fcmd = "cc Sully_%1$i.c -o Sully_%1$i && ./Sully_%1$i";
char *finj = "#include <stdlib.h>%1$c#include <stdio.h>%1$cint n = %2$i;%1$cint main(){%1$cchar *fname = %3$c%4$s%3$c;%1$cchar *fcmd = %3$c%5$s%3$c;%1$cchar *finj = %3$c%6$s%3$c;%1$cchar name[100], cmd[100];%1$cif (n < 0) exit(0);%1$csprintf(name, fname, n);%1$csprintf(cmd, fcmd, n);%1$cFILE* fl = fopen(name, %3$cw%3$c);%1$cif (fl > 0) fprintf(fl, finj, 10, n - 1, 34, fname, fcmd, finj);%1$cfflush(fl);%1$csystem(cmd);%1$c}%1$c";
char name[100], cmd[100];
if (n < 0) exit(0);
sprintf(name, fname, n);
sprintf(cmd, fcmd, n);
FILE* fl = fopen(name, "w");
if (fl > 0) fprintf(fl, finj, 10, n - 1, 34, fname, fcmd, finj);
fflush(fl);
system(cmd);
}
