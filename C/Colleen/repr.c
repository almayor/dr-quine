#include <stdio.h>

void replicate(const char *s) { printf(s, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 34, s, 34, 10, 9, 10, 10); }

/*
   outer comment
 */

int main(void)
{
	/*
	   inner comment
	 */
	const char *s = "#include <stdio.h>%c%cvoid replicate(const char *s) { printf(s, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9, 10, 9, 10, 9, 10, 9, 34, s, 34, 10, 9, 10, 10); }%c%c/*%c   outer comment%c */%c%cint main(void)%c{%c%c/*%c%c   inner comment%c%c */%c%cconst char *s = %c%s%c;%c%creplicate(s);%c}%c";
	replicate(s);
}
