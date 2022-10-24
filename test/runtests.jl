using Halton
using Test


base2nums = [1//2 , 1//4 , 3//4 , 1//8 , 5//8 , 3//8 , 7//8 , 1//16, 9//16, 5//16]
base3nums = [1//3, 2//3, 1//9, 4//9, 7//9, 2//9, 5//9, 8//9, 1//27, 10//27, ]

n = length(base2nums)

haltons = zeros(n)
HaltonSeq!(haltons, 2, skip=0)
@test float(base2nums) ≈ haltons
HaltonSeq!(haltons, 3, skip=0)
@test float(base3nums) ≈ haltons