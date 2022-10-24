module Halton

using Primes

export HaltonSeq

import Base: length, eltype

"""
    HaltonSeq(base, skip, length)

Iterator generates a Halton sequence of `Rational{Int}`s 
given a prime `base` and `length`, and skipping the first
`skip` elements.

The algorithm is presented in Kolar & O'Shea (1993),
<https://doi.org/10.1016/0898-1221(93)90307-H> uses 
`Vector`s `d` and `r` to keep track of intermediate
computations. 
"""
struct HaltonSeq
    d::Vector{Int}
    r::Vector{Rational{Int}}
    base::Int
    skip::Int
    length::Int
    
    function HaltonSeq(base::Integer, skip::Integer, length::Integer)

        isprime(base) || error("base number not prime")

        skip >= 0 || throw(DomainError(skip))
        
        # set D to get generated seq >= S
        S = skip + length
        D = ceil(Int, log(S) / log(base))
        
        # tmp vectors for remainders
        d = zeros(Int, D+1)
        r = zeros(Rational{Int}, D+1)

        # skip over initial elts, but need to update `d` and `r`
        for i in Base.OneTo(skip)
            update_halton_remainders!(d,r,base)
        end
        
        return new(d, r, base, skip, length)
    end
end

length(H::HaltonSeq) = H.length
eltype(::HaltonSeq) = Rational{Int}

"internal function for iteration"
function update_halton_remainders!(d,r,base)
    
    # they use the index "l" here
    j = 1  
    
    while d[j] == base-1
      d[j] = 0
      j += 1
    end
    
    d[j] += 1
    
    if j >= 2
      r[j-1] = (d[j] + r[j]) // base
    end
    
    if j >= 3
      for i in (j-1) : -1 : 2
        r[i-1] = r[i] // base
      end
    end
    
    return (d[1] + r[1]) // base

end

function Base.iterate(H::HaltonSeq, state=1)
    state > length(H) && return nothing
    return update_halton_remainders!(H.d, H.r, H.base), state+1
end


end # module