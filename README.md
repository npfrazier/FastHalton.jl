## HaltonDraws

Convenient interface for getting Halton Draws from a Normal distribution. Typically need for Monte Carlo integration. These are rough implementations of the code available [Kolář and O'Shea (1993) ](https://doi.org/10.1016/0898-1221(93)90307-H) and make no claim of coding efficiency or deep understanding.

Exports `HaltonSeq(base, skip, length)`, which is an iterator that returns a sequence of Halton draws of base `b` after discarding `skip` entries. These are returned as `Rational{Int}`s ([HaltonSequences.jl](https://github.com/tobydriscoll/HaltonSequences.jl) does this), and they can be collected into a `Vector{Rational{Int}}`, or copied to an `AbstractArray`, which can have eltypes `Rational` or `AbstractFloat`.

```julia

# 1000 halton draws of base 2 starting at 1001
draws2 = collect(HaltonSeq(2, 5000, 1000))

# preallocated
m,n = 10, 50
draws3 = Matrix{Float64}(undef, m, n)
copyto!(draws3, HaltonSeq(3, m*n))
```


##### To-Do:

* Add ability to use every $k$-th draw.

#### References

Kolář, Miroslav and Seamus O'Shea (1993). "Fast, portable, and reliable algorithm for the calculation of Halton numbers" *Computers \& Mathematics with Applications* 25(7):3-13. <https://doi.org/10.1016/0898-1221(93)90307-H>
