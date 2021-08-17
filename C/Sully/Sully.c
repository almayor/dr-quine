#include <stdlib.h>
#include <stdio.h>
int n = 5;
int main(){
char name[] = "Sully_X.c";
char cmd[] = "cc Sully_X.c -o Sully_X && ./Sully_X";
char* s = "#include <stdlib.h>%1$c#include <stdio.h>%1$cint n = %2$i;%1$cint main(){%1$cchar name[] = %3$cSully_X.c%3$c;%1$cchar cmd[] = %3$ccc Sully_X.c -o Sully_X && ./Sully_X%3$c;%1$cchar* s = %3$c%4$s%3$c;%1$cname[6] = '0' + n;%1$ccmd[9] = '0' + n;%1$ccmd[22] = '0' + n;%1$ccmd[35] = '0' + n;%1$cFILE* fl = fopen(name, %3$cw%3$c);%1$cif (fl > 0) fprintf(fl, s, 10, n - 1, 34, s);%1$cfflush(fl);%1$cif (n > 0) system(cmd);%1$c}%1$c";
name[6] = '0' + n;
cmd[9] = '0' + n;
cmd[22] = '0' + n;
cmd[35] = '0' + n;
FILE* fl = fopen(name, "w");
if (fl > 0) fprintf(fl, s, 10, n - 1, 34, s);
fflush(fl);
if (n > 0) system(cmd);
}
