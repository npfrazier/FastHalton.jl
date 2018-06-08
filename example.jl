using Halton

## Halton Sequence

# First 10 entries in Halton Sequence with base 3
H = Vector{Float64}(10)
B = 3
HaltonSeq!(H, B)

# Skip first 100 entries
HaltonSeq!(H, B, skip=100)

## Halton Draws

# 1000 Normal draws using a Halton sequence with base 17.
# Default: Skip the first 500 draws
H = Vector{Float64}(1000)
B = 17
HaltonDraws!(H, B)

# Check your work:
using Plots
gr()
histogram(H)

# 1000 Normal draws using a Halton sequence with base 17.
## Use Distributions.Uniform and skip no entries
## Requires Distributions.quantile(distr,x)
H = Vector{Float64}(1000)
B = 17
HaltonDraws!(H, B, distr=Distributions.Uniform(), skip=0)
