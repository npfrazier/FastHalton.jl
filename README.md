## HaltonDraws

Convenient interface for getting Halton Draws from a Normal distribution. Typically need for Monte Carlo integration. These are rough implementations of the code available [Kolář and O'Shea (1993) ](https://www.researchgate.net/publication/229173824_Fast_portable_and_reliable_algorithm_for_the_calculation_of_Halton_numbers) and make no claim of coding efficiency or deep understanding.

`HaltonDraws!(H::Array{Float64,1},B::Int; skip=500,distr=Normal())` replaces `H` with draws from `distr` using a Halton sequence of base `B` after discarding `skip` entries.

Also exports `HaltonSeq!(H::Array{Float64,1},B::Int;skip=0)` which replaces `H` with entries from a Halton sequence of base `B` after discarding `skip` entries.

##### To-Do:

* Add ability to use every $k$-th draw.

#### References

Kolář, Miroslav and Seamus O'Shea (1993). "Fast, portable, and reliable algorithm for the calculation of Halton numbers" *Computers \& Mathematics with Applications* 25(7):3-13.
