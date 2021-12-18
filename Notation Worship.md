a function takes parameters and returns a value
a procedure takes parameters and returns nothing (not even void)

typically, procedures mutate state

mutation of state is not bad - as long as the state is fenced-in in some way (e.g. locality of reference, etc.)

FP can describe the innards of procedures, but not composition of procedures
