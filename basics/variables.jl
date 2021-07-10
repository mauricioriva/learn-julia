#######################
###### Variables ######
#######################

# Variable names must begin with a letter (A-Z or a-z), 
# underscore, or a subset of Unicode code points greater than 00A0

# Assign the value 10 to the variable x
x = 10
# println(x)

# Doing math with x's value
x = x + 1
# println(x)

# Reassign x's value
x = 1 + 1
# println(x)

# You can assign values of other types, like strings of text
x = "Hello World!"
# println(x)

# Variable names are case-sensitive, and have no semantic meaning
δ = 0.00001
# println(δ)

안녕하세요 = "Hello"
# println(안녕하세요)

# You can type many Unicode math symbols by typing the backslashed LaTeX symbol name followed by tab.
# For example, the variable name δ can be entered by typing \delta-tab, 
# or even α̂⁽²⁾ by \alpha-tab-\hat- tab-\^(2)-tab.

###################################
###### Stylistic Conventions ######
###################################

# 1) Names of variables are in lower case.
# 2) Word separation can be indicated by underscores ('_'), 
#    but use of underscores is discouraged unless the name would be hard to read otherwise.
# 3) Names of Types and Modules begin with a capital letter and word separation is shown 
#    with upper camel case instead of underscores.
# 4) Names of functions and macros are in lower case, without underscores.
# 5) Functions that write to their arguments have names that end in !. 
#    These are sometimes called "mutating" or "in-place" functions because they are intended 
#    to produce changes in their arguments after the function is called, not just return a value.
