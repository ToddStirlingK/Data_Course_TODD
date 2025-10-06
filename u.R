## Practice 9/6/25 ##

## cars ####

car_20 = df_cars[df_cars$mpg > 20, ]
car_20 = df_cars[df_cars$cyl == 4, ]

## data frame ####

the_frame = data.frame(
  Name = c('bob', 'bill', 'frances', 'frank', 'merlyn'),
  Treatment = c('bear', 'kangaroo', 'fly', 'skunk', 'cat'),
  Results = c(1, 5, 8, 2, 9)
  
)

View(the_frame)

1+1
