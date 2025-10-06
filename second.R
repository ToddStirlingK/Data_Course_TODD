## write a loop print penguin, bird, fish

zoo <- c('penguin', 'bird', 'fish')

for (variable in zoo)
  {
  sent_1 <- paste(variable)
  print(sent_1)
  
}

## write a loop 1-5

int_1 <- c(1, 2, 3, 4, 5)

vec = c(1, 2, 3, 4, 5, 6,78..1000)
vec_1 = c(1, 2, 3, 4, 5)


for (variable in vec) {
  sent_2 <- paste(variable)
  print(sent_2)
  
}


for (variable in zoo) {
  for (animal in zoo) {
    for (number in vec_1) {
      out = paste(animal, number)
      print(out)
      
    }
    
  }
  
}


## crreate new col called 'fruit'
## fill in with vec fruit

dat_BIOL3100 <- data.frame(
  Name = c('bill', 'bobby', 'billy'),
  no = c(1,2,3),
  vec_fruit
)

View(dat_BIOL3100)

new_df = data.frame(
  Name = c('bill', 'bobby', 'billy'),
  no = c(1,2,3),
  vec_fruit
)

dim(new_df)
new_df$no
new_df$name
new_df$fruit <- vec_fruit

new_fruit = c('pineapple', 'banana')

new_df$fruit <- new_fruit

for (i in 1:nrow(new_df)) {
  new_df$animal[i] = zoo[i]
  
}




df_bird = read.csv('Data/BioLog_Plate_Data.csv')
head(df_bird, n = 2)
tail(df_bird)

readLines(df_bird)
?readLines()
readLines('Data/BioLog_Plate_Data.csv', n = 2)


## create an new object call 'car_4' save only car with 4 cyl

View(df_cars)
df_cars = mtcars
car_4 = df_cars[df_cars$cyl == 3, ]
car_4
df_cars[1:8, ]




