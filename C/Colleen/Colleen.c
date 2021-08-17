#include <stdio.h>

void replicate(const char *s) { printf(s, 10, 9, 34, s, 34); }

/*
   outer comment
 */

int main(void)
{
	/*
	   inner comment
	 */
	const char *s = "#include <stdio.h>%1$c%1$cvoid replicate(const char *s) { printf(s, 10, 9, 34, s, 34); }%1$c%1$c/*%1$c   outer comment%1$c */%1$c%1$cint main(void)%1$c{%1$c%2$c/*%1$c%2$c   inner comment%1$c%2$c */%1$c%2$cconst char *s = %c%s%c;%1$c%2$creplicate(s);%1$c}%1$c";
	replicate(s);
}
