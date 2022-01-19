# https://github.com/status-im/nim-chronos/issues/255
#
# ./env.sh nim c -r --out:build/chronos_255 issues/chronos_255.nim
#
# on nim-chronos master branch with commit c25fa1f or later (most recent is
# 17fed89) this program will crash at runtime on posix systems with:
#
# Error: unhandled exception: (38) Socket operation on non-socket [TransportOsError]
#
# The number in parentheses may vary by system

import pkg/chronos

let
  (rfd, wfd) = createAsyncPipe()
  transp = fromPipe(wfd)

discard waitFor transp.write("foobar")
