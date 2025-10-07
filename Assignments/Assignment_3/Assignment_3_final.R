###########################
#                         #
#    Assignment Week 3    #
#                         # 
###########################

# Instructions ####
# Fill in this script with stuff that we do in class.
# It might be a good idea to include comments/notes as well so you remember things we talk about
# At the end of this script are some comments with blank space after them
# They are plain-text instructions for what you need to accomplish.
# Your task is to write the code that accomplished those tasks.

# Then, make sure to upload this to both Canvas and your GitHub repository


# YOUR REMAINING HOMEWORK ASSIGNMENT (Fill in with code) ####

# 1.  Get a subset of the "iris" data frame where it's just even-numbered rows

seq(2,150,2) # here's the code to get a list of the even numbers between 2 and 150

setwd('../../Data')

View(iris)

?seq

?slice

iris_evn = iris %>%
  slice(seq(2, 150, by = 2))

view(iris_evn)

# 2.  Create a new object called iris_chr which is a copy of iris, except where every column is a character class

?across

iris_chr = iris %>%
  mutate(across(everything(), as.character))

str(iris_chr)


# 3.  Create a new numeric vector object named "Sepal.Area" which is the product of Sepal.Length and Sepal.Width

Sepal_Area = iris$Sepal.Length * iris$Sepal.Width


# 4.  Add Sepal.Area to the iris data frame as a new column

new_iris = iris %>%
  mutate(Sepal.Area = Sepal_Area)

?mutate

view(new_iris)

# 5.  Create a new dataframe that is a subset of iris using only rows where Sepal.Area is greater than 20 
      # (name it big_area_iris)

big_area_iris = new_iris %>% 
  filter(Sepal.Area > 20)

view(big_area_iris)


# 6.  Upload the last numbered section of this R script (with all answers filled in and tasks completed) 
      # to canvas
      # I should be able to run your R script and get all the right objects generated









