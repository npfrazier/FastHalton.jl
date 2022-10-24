using Halton
using Test


base2nums = [1//2 , 1//4 , 3//4 , 1//8 , 5//8 , 3//8 , 7//8 , 1//16, 9//16, 5//16]

n = length(base2nums)

base2test = zeros(n)
HaltonSeq!(base2test, 2, skip=0)
@test float(base2nums) == base2test
