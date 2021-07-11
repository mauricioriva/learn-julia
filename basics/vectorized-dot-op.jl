########################################
###### Vectorized "dot" operators ######
########################################

# For every binary operation like ^, there is a corresponding "dot" operation .^ that is 
# automatically defined to perform ^ element-by-element on arrays. For example, [1,2,3] ^ 3 
# is not defined, since there is no standard mathematical meaning to "cubing" a (non-square) array, 
# but [1,2,3] .^ 3 is defined as computing the elementwise (or "vectorized") result [1^3, 2^3, 3^3]. 
# Similarly for unary operators like ! or √, there is a corresponding .√ that applies the operator elementwise.

# [1,2,3] .^ 3
println([1,2,3] .^ 3)  # [1, 8, 27]


