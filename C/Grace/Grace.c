#include <stdio.h>
/*
  This is Grace!
*/
#define PROG int main() { FILE* stream = fopen("Grace_kid.c", "w"); if (stream > 0) REPL(stream); }
#define REPL(stream) fprintf(stream, SRCS, 10, SRCS, 34)
#define SRCS "#include <stdio.h>%1$c/*%1$c  This is Grace!%1$c*/%1$c#define PROG int main() { FILE* stream = fopen(%3$cGrace_kid.c%3$c, %3$cw%3$c); if (stream > 0) REPL(stream); }%1$c#define REPL(stream) fprintf(stream, SRCS, 10, SRCS, 34)%1$c#define SRCS %3$c%2$s%3$c%1$cPROG%1$c"
PROG
