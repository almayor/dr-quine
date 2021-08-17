#!/usr/bin/env python3

def replicate(s):
	print(s % repr(s))

# This is Colleen!

def main():
	# Hello from Dr. Quine!
	s = '#!/usr/bin/env python3\n\ndef replicate(s):\n\tprint(s %% repr(s))\n\n# This is Colleen!\n\ndef main():\n\t# Hello from Dr. Quine!\n\ts = %s\n\treplicate(s)\n\nmain()'
	replicate(s)

main()
