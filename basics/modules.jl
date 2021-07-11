#####################
###### Modules ######
#####################

# The recommended style is not to indent the body of the module, since that would typically lead to 
# whole files being indented. Also, it is common to use UpperCamelCase for module names (just like types), 
# and use the plural form if applicable, especially if the module contains a similarly named identifier, 
# to avoid name clashes.

module SomeModule
    
include("file1.jl")
include("file2.jl")

end

# Export lists

module NiceStuff

export nice, DOG

struct Dog end      # singleton type, not exported

const DOG = Dog()   # named instance, exported

nice(x) = "nice $x" # function, exported

end

# A module can have multiple export statements in arbitrary locations.


# Standalone using and import

using NiceStuff

# Would load the above code, making NiceStuff (the module name), DOG and nice available. 
# Dog is not on the export list, but it can be accessed if the name is qualified with the module path 
# (which here is just the module name) as NiceStuff.Dog.

# Importantly, using ModuleName is the only form for which export lists matter at all.


import NiceStuff

# brings only the module name into scope. Users would need to use NiceStuff.DOG, NiceStuff.Dog, 
# and NiceStuff.nice to access its contents.
