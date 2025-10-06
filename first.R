# 1+1 ####

# header ####
## header2 ####

an_object = 1+1

# object in R ####
# vector: one dimension, same type (numeric
)
# metrix: 2 dim same type
# array: similar to matrix, multiple dimmention, same type
# data frame: 2 dimention, dif type, same length
# list: multi dim, fid type, dif length

## vector ####
y = c(1, 'apple', TRUE)

vec1 = c(1, 2, 3)

vec1 + 1
is.numeric(vec1)

vec2 = c('orange')

is.numeric(vec2)

## matrix ####

mat <- matrix(data = 1:6, nrow =2)
mat
mat[1,2]
# [row, colum]

## array ####

arr <- array(1:12, dim = c(2, 2, 3))
arr

## data frame ####

datafam <- data.frame(
  Name = c('evang', 'Hasan', 'tyler')
  fav_no = c(7, 8, 7)
)

## list ####

lis <- list(
  Name = c('evang', 'Hasan', 'tyler')
  fav_no = c(7, 8, 7)
  color = c('red', 'blue', 'green', 'purple')
  )


## file ####

dat_bio <- read.csv(file= 'Data/BioLog_Plate_Data.csv')
dim(dat_bio)
names(dat_bio)

file_all <- list.files('Data/')
length(file_all)

file_all <- list.files('Data/', pattern = '.csv' 
                       recursive = F))

## loop ####

I like cherries
I like rasberries
I like apple

vec_fruit <- c('cherries', 'rasberries', 'apple')
vec_fruit

for (variable in vec_fruit) {
  new_sent <- paste('I like', i)
  print(new_sent)
}

hate <- c('mayo', 'bruss')

for (variable in hate) {
  new_sent <- paste('I hate')
  print(new_sent)
}








