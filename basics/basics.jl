#################################################
###### Integers and Floating-Point Numbers ######
#################################################

# Julia's primitive numeric types:

# Integer types

# Type	Signed?	Number of bits	Smallest value	Largest value
# Int8	   ✓         8	            -2^7	       2^7 - 1
# UInt8		         8	              0	           2^8 - 1
# Int16	   ✓	     16	            -2^15	       2^15 - 1
# UInt16		     16	              0	           2^16 - 1
# Int32	   ✓	     32	            -2^31	       2^31 - 1
# UInt32		     32	              0	           2^32 - 1
# Int64	   ✓	     64	            -2^63	       2^63 - 1
# UInt64		     64	              0	           2^64 - 1
# Int128   ✓	     128	        -2^127	       2^127 - 1
# UInt128		     128	          0	           2^128 - 1
# Bool	  N/A	     8	            false (0)	   true (1)    <- implemented as an 8-bit primitive type

# Floating-point types:

# Type	    Precision	Number of bits
# Float16	half	        16
# Float32	single	        32
# Float64	double	        64

typeof(12) # Int64

# Unsigned integers are input and output using the 0x prefix and hexadecimal (base 16) digits 0-9a-f 
# (the capitalized digits A-F also work for input). The size of the unsigned value is determined 
# by the number of hex digits used:

x = 0x1
# 0x01

typeof(x) # UInt8

x = 0x123 # UInt16

x = 0x1234567 # UInt32

##################################
###### Arithmetic Operators ######
##################################

# The following arithmetic operators are supported on all primitive numeric types:

# Expression	Name	            Description
#   +x	        unary plus	        the identity operation
#   -x	        unary minus	        maps values to their additive inverses
#   x + y	    binary plus	        performs addition
#   x - y	    binary minus	    performs subtraction
#   x * y	    times	            performs multiplication
#   x / y	    divide	            performs division
#   x ÷ y	    integer divide	    x / y, truncated to an integer
#   x \ y	    inverse divide	    equivalent to y / x
#   x ^ y	    power	            raises x to the yth power
#   x % y	    remainder	        equivalent to rem(x,y)

###############################
###### Boolean Operators ######
###############################

# Expression	Name
#   !x	        negation
#   x && y	    short-circuiting and
#   x || y	    short-circuiting or

###############################
###### Bitwise Operators ######
###############################

# Expression	Name
#    ~x	        bitwise not
#   x & y	    bitwise and
#   x | y	    bitwise or
#   x ⊻ y	    bitwise xor (exclusive or)
#   x >>> y	    logical shift right
#   x >> y	    arithmetic shift right
#   x << y	    logical/arithmetic shift left

#################################
###### Numeric Comparisons ######
#################################

# Operator	    Name
#   ==	        equality
#  !=, ≠	    inequality
#   <	        less than
# <=, ≤	        less than or equal to
#   >	        greater than
#  >=, ≥	    greater than or equal to

################################
###### Updating operators ######
################################

# +=  -=  *=  /=  \=  ÷=  %=  ^=  &=  |=  ⊻=  >>>=  >>=  <<=

#######################
###### Functions ######
#######################

function g(x,y)
    return x + y
end

function hypot(x,y)
    x = abs(x)
    y = abs(y)
    if x > y
        r = y/x
        return x*sqrt(1+r*r)
    end
    if y == 0
        return zero(x)
    end
    r = x/y
    return y*sqrt(1+r*r)
end

function fact(n::Int)
    n >= 0 || error("n must be non-negative")
    n == 0 && return 1
    n * fact(n-1)
end

#################################
###### Anonymous Functions ######
#################################

x -> x + x

function (x)
    x + x
end
