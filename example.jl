using Halton

## Halton Sequence

# First 10 entries in Halton Sequence with base 3
H = zeros(10)
base = 3
HaltonSeq!(H,base)

# Skip first 100 entries
HaltonSeq!(H,base, skip = 100)

## Halton Draws

# 1000 Normal draws using a Halton sequence with base 17.
# Default: Skip the first 500 draws
H = zeros(1000)
B = 17
HaltonDraws!(H,B)
# Check your work:
# using PyPlot
# plt[:hist](sort!(HaltonDraws!(H,B)),100)

# 1000 Normal draws using a Halton sequence with base 17.
## Use Distributions.Uniform and skip no entries
## Requires Distributions.quantile(distr,x)
H = zeros(1000)
B = 17
HaltonDraws!(H,B,distr=Distributions.Uniform(),skip=0)
