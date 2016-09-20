module Halton

using Distributions

export HaltonSeq!, HaltonDraws!

"""
`HaltonSeq!(H::Array{Float64,1},B::Int64, [skip=0])`

Replaces *H* with entries from Halton low discrepancy sequence with base *B*. Accepts keyword arguments to set Distributions.*distr* and to discard first *skip* entries.

"""
function HaltonSeq!(H::Array{Float64,1},B::Int;skip=0)
  #

  isprime(B) || error("base number not prime")

  return H[:] = H!(zeros(length(H)+skip),B)[skip+1:end]
end

"""
`HaltonDraws!(H::Array{Float64,2},B::Array{Int64,1}, [skip=500,distr=Normal()])`

Fills each column of *H* with entries from Halton low discrepancy sequence with the prime number in the equivalent index in *B*. Accepts keyword arguments to skip the first *skip* entries and to change the Distributions package distribution from the default of *Normal()*.

"""
function HaltonDraws!(H::Array{Float64,1},B::Int; skip=500,distr=Normal())
  Distributions.quantile(distr,HaltonSeq!(H,B,skip=skip))
end

####

## Algorithm for generating Halton sequences
function H!(H::Array{Float64,1},b::Int)
  # Fill H with Halton Sequence based on b
  S = length(H)
  # set D to get generated seq >= S
  D = ceil(Int64,log(S)/log(b))
  # placeholders
  d = zeros(Float64,D+1)
  r = zeros(Float64,D+1)

  # based on algorithm found in https://www.researchgate.net/publication/229173824_Fast_portable_and_reliable_algorithm_for_the_calculation_of_Halton_numbers
  for nn in 1:S
    ii = 1
    while d[ii] == b-1
      d[ii] = 0
      ii += 1
    end
    d[ii] += 1
    if ii>=2
      r[ii-1] = (d[ii]+r[ii])/b
    end
    if ii >= 3
      for jj in (ii-1):-1:2
        r[jj-1] = r[jj]/b
      end
    end
    H[nn] = (d[1]+r[1])/b
  end
  return H
end

end
