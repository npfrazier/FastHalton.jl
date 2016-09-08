## HaltonDraws

Convenient interface for getting Halton Draws from a Normal distribution. Typically need for Monte Carlo integration. These are rough implementations of the code available on Wikipedia and make no claim of coding efficiency or deep understanding.

`HaltonDraws(N::Int64,B::Int64, [skip=true,skip_val=100])` produces `N` Normal draws using a Halton sequence of base `B`. Includes option to skip the first set number of entries as is typical in applications.

Also exports `HaltonSequence(N::Int64,b::Int64;skip=false,skip_val=100)` which produces the first `N` draws from the sequence.

TODO:

* Add ability to use every $k$-th draw.
