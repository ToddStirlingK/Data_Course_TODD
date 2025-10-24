

## 1. create a dataframe using mtcars, for mpg >20 and cyl =6
## 2. in the dataframe add new column mpg x cyl
## 3. write a for loop to bring out each car (rowname)


# 1.

df_cars = mtcars

mpg_ = df_cars[df_cars$mpg > 20, ]
mpg_cyl = mpg_[mpg_$cyl == 6, ]

View(mpg_cyl)

# 2. 

mpg_cyl$mpg
mpg_ctl$cyl

mpgxcyl = mpg_cyl$mpg * mpg_cyl$cyl

View(mpgxcyl)

mpg_cyl$mpgxcyl = mpgxcyl

# 3. 

mpg_cyl[i, ]

for (i in 1:3) {
    print(mpg_cyl[i, ])
}


## read/load data

write.csv(mpg_cyl, 'my_wonderful_cars.csv')


## install package

install.packages('qrcode')