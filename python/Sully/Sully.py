#!/usr/bin/env python3

import os

n = 5
s = '#!/usr/bin/env python3\n\nimport os\n\nn = %d\ns = %s\nf = open("Sully_%%d.py" %% n, "w")\nf.write(s %% (n - 1, repr(s)))\nf.close()\nif n > 0: os.system("python3 Sully_%%d.py" %% n)'
f = open("Sully_%d.py" % n, "w")
f.write(s % (n - 1, repr(s)))
f.close()
if n > 0: os.system("python3 Sully_%d.py" % n)