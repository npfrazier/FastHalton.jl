using Halton
using Test
using StatsFuns

base2nums = [1//2 , 1//4 , 3//4 , 1//8 , 5//8 , 3//8 , 7//8 , 1//16, 9//16, 5//16]
base3nums = [1//3, 2//3, 1//9, 4//9, 7//9, 2//9, 5//9, 8//9, 1//27, 10//27, ]

n = length(base2nums)
skip = 0
@test collect(HaltonSeq(2,n,skip)) == base2nums
@test collect(HaltonSeq(3,n,skip)) == base3nums

# -----------------------
# example
# -----------------------

# 1000 halton draws of base 2 starting at 1001
draws2 = collect(HaltonSeq(2, 5000, 1000))

# preallocated
m,n = 10, 50
draws3 = Matrix{Float64}(undef, m, n)
copyto!(draws3, HaltonSeq(3, m*n))

# could also do
HaltonSeq!(draws3, 3, 1000)
HaltonDraws!(draws3, 3; skip=1000, invcdf=StatsFuns.norminvcdf)
