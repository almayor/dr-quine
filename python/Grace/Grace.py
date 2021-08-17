#!/usr/bin/env python3

# This is Grace!

prog = 'f = open("Grace_kid.py", "w"); %s; f.close()'
repl = 'f.write(%s\n)'
srcs = '#!/usr/bin/env python3\n\n# This is Grace!\n\nprog = %s\nrepl = %s\nsrcs = %s\n\nexec(prog %% repl %% repr(srcs %% (repr(prog), repr(repl), repr(srcs))))'

exec(prog % repl % repr(srcs % (repr(prog), repr(repl), repr(srcs))))