test1:
input=ac
blockbegin=a
blockend=c
block="a"
replacement=*   // a is replaced by *
result=*c


N.B. The expanding is done recursively.  If you need to expand a block into another block which contains the same begin-regex, the expansion will go into an infinite loop. An example of how to handle this case is in test6, e.g. expand `query` into `~`, then later, used `sed` to put the `query` back, noting that `~` will not trigger a re-expansion, i.e. `## query` is mapped to `## ~` then later re-mapped to `## query`.
