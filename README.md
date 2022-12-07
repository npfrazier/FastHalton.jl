## HaltonSequence.jl

See [this package](https://github.com/tobydriscoll/HaltonSequences.jl) for similar functionality available directly from the Julia Package registry.

[![Build Status](https://travis-ci.com/npfrazier/Halton.jl.svg?branch=main)](https://travis-ci.com/npfrazier/Halton.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/npfrazier/Halton.jl?svg=true)](https://ci.appveyor.com/project/npfrazier/Halton-jl)

Convenient interface for getting a set of entries from a Halton Sequence. Typically needed for Monte Carlo integration. These are rough implementations of the code available [Kolář and O'Shea (1993) ](https://doi.org/10.1016/0898-1221(93)90307-H) and make no claim of coding efficiency or deep understanding.

Exports `HaltonSeq(base, skip, length, invcdf=identity)`, which is an iterator that returns a sequence of Halton draws of base `b` after discarding `skip` entries. These are returned as `Rational{Int}`s ([HaltonSequences.jl](https://github.com/tobydriscoll/HaltonSequences.jl) does this), and they can be collected into a `Vector{Rational{Int}}`, or copied to an `AbstractArray`, which can have eltypes `sRational` or `AbstractFloat`. Argument `invcdf` defaults to the `identity` function but can be switched to an inverse CDF to obtain draws from a particular distribution.

The iterator does not provide draws from a normal distribution but rather the low discrepancy Halton sequence over the interval $(0,1)$. Use the `invcdf` argument to draws from a particular distribution. For example `using StatsFuns: norminvcdf; HaltonSeq(2, 5000, 100, norminvcdf)`

```julia
using StatsFuns

BASE = 2
SKIP = 5000
LENGTH = 1000
INVCDF = norminvcdf

# 1000 halton draws of base 2 starting at 1001
draws2 = collect(HaltonSeq(BASE, SKIP, LENGTH, INVCDF))

# preallocated
m,n = 10, 50
draws3 = Matrix{Float64}(undef, m, n)
HaltonSeq!(draws3, BASE, SKIP)
```


##### To-Do:

* Add ability to use every $k$-th draw.

#### References

Kolář, Miroslav and Seamus O'Shea (1993). "Fast, portable, and reliable algorithm for the calculation of Halton numbers" *Computers \& Mathematics with Applications* 25(7):3-13. <https://doi.org/10.1016/0898-1221(93)90307-H>
