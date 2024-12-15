#!/usr/bin/env bash

# FIRST Hello World ----
# Prints Hello World on terminal

echo "Hello World"

# VARIABLES ----
# There's no data types!
# Everything is basically text
# Just use the = sign

name="kkck"

# Notice: don't leave spaces before & after the = sign
# Access w $ sign

echo $name

# A good practice is using curly brackets to wrap

echo "Hi there ${name}"

# Printing the parameters w $
# For this you execute the script like this:
# ./scriptname.sh parameter1 parameter2
# or:
# ./scriptname.sh "Hello World" "my name is kkck"
# so you can use spaces

echo "Hello there ${1}"
# First parameter
echo "Hello there ${2}"
# Second parameter
echo "Hello there ${@}"
# All parameters
echo "The name of the file is: ${0}"
# You can also reference the file itself with $0

# USER INPUT ----

echo "What's your name"

read name

echo "Hi ${name}!"

# We ask the user for their name and then we greet him
# We can reduce code w the -p flag
# This prints a message before asking

read -p "What's your name: " name

echo "Hi ${name}!"

# ARRAYS ----
# To initialize an array just use ()
# and divide each value w a space

my_array=("value 1" "value 2" "value 3")

# To access a sigle value you need its index
# it starts w 0 so...

echo ${my_array[1]}

# This prints "value 2"

# You can also access the last element like this:

echo ${my_array[-1]}

# And to return all the values you use the @ sign

echo ${my_array[@]}

# Notice: that the curly brackets are mandatory
# Another useful thing is that you can use the # sign
# to return the number of elements:

echo ${#my_array[@]}

# STRING SLICING ----
# You can extract portions of a string
# like this: ${string:start:length}
# Where: start is the index
# and: length is the number of characters to extract

text="Hello World"

# Let's extract from index 0 four characters
echo "${text:0:4}"

# Now from index 6 to the end
echo "${text:6}"

# If 'length' exceeds, it stops at the end
echo "${text:9:9}"

# Note that 'length' represents the max length
# of the substring, not the ending index
# Let's do an experiment!
# Let's see what happend if we start w an index
# that exceeds the string

echo "${text:20}"

# and... nothing happens

# CONDITIONAL EXPRESSIONS
# In Bash (exclusively Bash) conditional expressions
# are used by the [[ compound command
# You can use "[" but is less modern

# Here's a list of the most popular Bash conditional expressions

# -- file expressions


