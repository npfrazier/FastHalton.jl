

using Halton

# Get 1000 Normal draws using a Halton sequence with base 17.
# Skip the first 200 draws.
HaltonDraws(1000,17,skip_val=200)


# First 8 entries in Halton Sequence with base 3
HaltonSequence(8,3)
