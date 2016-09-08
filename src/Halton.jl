module Halton

using Distributions

export HaltonSequence, HaltonDraws

function Halton_n(i::Int,b::Int64)
  # Produce the i-th number in Halton sequence
  # Based off of wikipedia article
  # i -- index
  # b -- base
  r = 0 # result
  f = 1 # start with unit interval
  while i>0
    f = f/b # divide unit interval
    r = r + f * (i % b)
    i = floor(i/b)
  end
  return r
end

"""
`HaltonSequence(N::Int64,B::Int64, [skip=false,skip_val=100])`

Function to generate `N` entries from the Halton low discrepancy sequence with base `B`.
Accepts keyword arguments to skip the first `skip_val` entries.

"""
function HaltonSequence(N::Int64,b::Int64;skip=false,skip_val=100)

  hs = zeros(N+skip*skip_val)
  for i in 1:length(hs)
      hs[i] = Halton_n(i,b)
  end
  hs[skip*skip_val+1:end]
end


"""
`HaltonDraws(N::Int64,B::Int64, [skip=true,skip_val=100])`

Generates `N` draws from a Normal distribution using a Halton sequence with base `B`.
Uses the inverse cdf to convert the sequence to points along real line.
Accepts keyword arguments to skip the first `skip_val` entries.

Not optimized. Just convenient.
"""
function HaltonDraws(N::Int64,b::Int64;skip=true,skip_val=100)
  Distributions.quantile(Distributions.Normal(),HaltonSequence(N,b,skip=skip,skip_val=skip_val))
end

end
