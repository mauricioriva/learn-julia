########################
###### Data Types ######
########################

# (1 + 2)::Int
# 3

function f(y::Int)
    x::Int8 = 100
    x + y
end

x = f(20) # 120

typeof(x) # Int8

############################
###### Abstract Types ######
############################

# abstract type «name» end
# abstract type «name» <: «supertype» end

abstract type Number end
abstract type Real     <: Number end
abstract type AbstractFloat <: Real end
abstract type Integer  <: Real end
abstract type Signed   <: Integer end
abstract type Unsigned <: Integer end

# The Number type is a direct child type of Any, and Real is its child. 

#############################
###### Primitive Types ######
#############################

# primitive type «name» «bits» end
# primitive type «name» <: «supertype» «bits» end

# primitive type Float16 <: AbstractFloat 16 end
# primitive type Float32 <: AbstractFloat 32 end
# primitive type Float64 <: AbstractFloat 64 end

# primitive type Bool <: Integer 8 end
# primitive type Char <: AbstractChar 32 end

# primitive type Int8    <: Signed   8 end
# primitive type UInt8   <: Unsigned 8 end
# primitive type Int16   <: Signed   16 end
# primitive type UInt16  <: Unsigned 16 end
# primitive type Int32   <: Signed   32 end
# primitive type UInt32  <: Unsigned 32 end
# primitive type Int64   <: Signed   64 end
# primitive type UInt64  <: Unsigned 64 end
# primitive type Int128  <: Signed   128 end
# primitive type UInt128 <: Unsigned 128 end

####################
###### Struct ######
####################

struct Foo 
    bar  # Any
    baz::Int
    qux::Float64
end

foo = Foo("Hello", 23, 1.5)

typeof(foo) # Foo

fieldnames(Foo) # (:bar, :baz, :qux)

foo.bar # "Hello"

# Composite objects declared with struct are immutable; they cannot be modified after construction.

mutable struct Bar
    baz
    qux::Float64
end

bar = Bar("Hello", 1.5)

bar.qux = 2.0

bar.baz = 1//2

#########################
###### Type Unions ######
#########################

IntOrString = Union{Int,AbstractString}

1 :: IntOrString

"Hello" :: IntOrString

# 1.0 :: IntOrString - ERROR

##############################
###### Parametric Types ######
##############################

# An important and powerful feature of Julia's type system is that it is parametric: types can 
# take parameters, so that type declarations actually introduce a whole family of new types – one  
# for each possible combination of parameter values. 

struct Point{T}
    x::T
    y::T
end

# Point{Float64}
# Point{AbstractString}

# Point{Float64} <: Point 
# true

# Point{AbstractString} <: Point
# true

# Point{Float64} <: Point{Real}
# false

# !!!! Even though Float64 <: Real we DO NOT have Point{Float64} <: Point{Real}. !!!!

# Define a method that accepts all arguments of type Point{T} where T is a subtype of Real
function norm(p::Point{<:Real})
    sqrt(p.x^2 + p.y^2)
end

p = Point{Float64}(1.0, 2.0)

typeof(p) # Point{Float64}(1.0, 2.0)

p1 = Point(1,2)

typeof(p1) # Point{Int64}(1, 2)

# p3 = Point(1, 2.5) !!!! Error !!!!

#######################################
###### Parametric Abstract Types ######
#######################################

abstract type Pointy{T} end

struct Point{T} <: Pointy{T}
    x::T
    y::T
end

# Point{Float64} <: Pointy{Float64}
# true

# Point{Float64} <: Pointy{Real}
# false

# Point{Float64} <: Pointy{<:Real}
# true

struct DiagPoint{T} <: Pointy{T}
    x::T
end

# Now both Point{Float64} and DiagPoint{Float64} are implementations of the Pointy{Float64} abstraction, 
# and similarly for every other possible choice of type T. This allows programming to a common interface 
# shared by all Pointy objects, implemented for both Point and DiagPoint

struct Point{T<:Real} <: Pointy{T}
    x::T
    y::T
end

# Real-world example of how all this parametric type machinery can be useful

struct Rational{T<:Integer} <: Real
    num::T
    den::T
end

# It only makes sense to take ratios of integer values, so the parameter type T is restricted to 
# being a subtype of Integer, and a ratio of integers represents a value on the real number line, 
# so any Rational is an instance of the Real abstraction.

#########################
###### Tuple Types ######
#########################

struct Tuple2{A,B}
    a::A
    b::B
end

typeof((1,"foo",2.5)) # Tuple{Int64, String, Float64}

# Vararg Tuple types

mytupletype = Tuple{AbstractString,Vararg{Int}}
# Tuple{AbstractString, Vararg{Int64, N} where N}

isa(("1",), mytupletype)
# true

# Named Tuple Types

typeof((a=1,b="hello"))
# NamedTuple{(:a, :b), Tuple{Int64, String}}

# The @NamedTuple macro provides a more convenient struct-like syntax for declaring NamedTuple types 
# via key::Type declarations, where an omitted ::Type corresponds to ::Any.

@NamedTuple{a::Int, b::String}
# NamedTuple{(:a, :b), Tuple{Int64, String}}

@NamedTuple begin
    a::Int
    b::String
end

# NamedTuple{(:a, :b), Tuple{Int64, String}}

############################
###### UnionAll Types ######
############################

const T1 = Array{Array{T,1} where T, 1}
# Vector{Vector{T} where T} (alias for Array{Array{T, 1} where T, 1})

const T2 = Array{Array{T, 1}, 1} where T
# Array{Vector{T}, 1} where T

# Type T1 defines a 1-dimensional array of 1-dimensional arrays; each of the inner arrays consists 
# of objects of the same type, but this type may vary from one inner array to the next. On the other hand, 
# type T2 defines a 1-dimensional array of 1-dimensional arrays all of whose inner arrays must have the 
# same type. Note that T2 is an abstract type, e.g., Array{Array{Int,1},1} <: T2, whereas T1 is a 
# concrete type. As a consequence, T1 can be constructed with a zero-argument constructor a=T1() but 
# T2 cannot.

Vector{T} = Array{T, 1}

# This is equivalent to const Vector = Array{T,1} where T. 
# Writing Vector{Float64} is equivalent to writing Array{Float64,1}

####################################
###### Type{T} type selectors ######
####################################

# For each type T, Type{T} is an abstract parametric type whose only instance is the object T.

isa(Float64, Type{Float64})
# true

isa(Real, Type{Float64})
# false

isa(Real, Type{Real})
# true

# In other words, isa(A, Type{B}) is true if and only if A and B are the same object and that object is a type.

struct WrapType{T}
    value::T
end

WrapType(Float64) # default constructor, note DataType
# WrapType{DataType}(Float64)

WrapType(::Type{T}) where T = WrapType{Type{T}}(T)
# WrapType

WrapType(Float64) # sharpened constructor, note more precise Type{Float64}
# WrapType{Type{Float64}}(Float64)

####################################
###### Custom pretty-printing ######
####################################

struct Polar{T<:Real} <: Number
    r::T
    Θ::T
end

Polar(r::Real,Θ::Real) = Polar(promote(r,Θ)...)
# Polar
