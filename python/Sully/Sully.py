#!/usr/bin/env python3

import os, sys

n = 5
if n < 0: sys.exit(0)
s = '#!/usr/bin/env python3\n\nimport os, sys\n\nn = %d\nif n < 0: sys.exit(0)\ns = %s\nf = open("Sully_%%d.py" %% n, "w")\nf.write(s %% (n - 1, repr(s)))\nf.close()\nos.system("python3 Sully_%%d.py" %% n)'
f = open("Sully_%d.py" % n, "w")
f.write(s % (n - 1, repr(s)))
f.close()
os.system("python3 Sully_%d.py" % n)