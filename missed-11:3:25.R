#11/3/25

#missed class

#class notes#

full_join()

mean(mpg$cty)
sum(mpg$cty)


# funciton without argument
date = function(){
  print('Today is Tuesday!!!')
}

date()

## function with argument
add_value = function(x, y){
  result = x + y
  return(result)
}

add_value(20000, 1233)



clean_bird_dat = function(dat){
  
  # cols to keep
  iwant = c("Family", "Species_number", "Species_name", "English_name",
            "Clutch_size", "Egg_mass", "Mating_System")
  
  # clean male data
  df_male = dat %>% 
    select(iwant, starts_with('M_'), -ends_with('_N')) %>% 
    mutate(sex = 'male') 
  
  # clean female
  df_female = dat %>% 
    select(iwant, starts_with('F_'), -ends_with('_N')) %>% 
    mutate(sex = 'female') 
  
  # clean unsexed data
  df_unsex = dat %>% 
    select(iwant, starts_with('Unsexed_'), -ends_with('_N')) %>% 
    mutate(sex = 'unsexed') 
  
  # clean col names
  names(df_male) = names(df_male) %>% str_remove('M_')
  names(df_female) = names(df_female) %>% str_remove('F_')
  names(df_unsex) = names(df_unsex) %>% str_remove('Unsexed_')
  
  # join
  clean_dat = df_male %>% 
    full_join(df_female) %>% 
    full_join(df_unsex) 
  
  # return a cleaned data frame
  return(clean_dat)
  
}

dat = read.csv('Data/Bird_Measurements.csv')

source('My_function.R')
library(tidyverse)

devtools::
  
  
  View(dat)
clean_dat = clean_bird_dat(dat)
View(clean_dat)

## make a function and use it!

## load data 'height.xlsx' 
## plot and determine whether female and male have differnt height

library(readxl)
library(measurements)
dat = read_xlsx('/Users/frog/Desktop/Data_Course_TODD/Data/height.xlsx')
View(dat)

library(measurements)
dat_height_clean = dat %>% 
  pivot_longer(everything(),
               names_to = 'sex',
               values_to = 'height') %>% 
  separate(height, into = c('feet', 'inch'), convert = T) %>% 
  mutate(total_inch = feet*12 + inch) %>% 
  mutate(cm = conv_unit(total_inch, from = 'in', to = 'cm')) %>% View()


dat_height_clean %>% 
  ggplot(aes(x = cm, fill = sex)) +
  geom_density(alpha = 0.5)

dat_height_clean %>% 
  group_by(sex) %>% 
  summarise(mean = mean(cm),
            sd = sd(cm)) %>% View()

?t.test()

#Null hypothesis (H0)
# alternative hypothesis (Ha)

t.test(dat_height_clean$cm ~ dat_height_clean$sex)

glm()

mod = glm(dat = dat_height_clean,
          formula = cm ~ sex)

names(dat_height_clean)
y = ax + b


summary(mod)

mpg
View(mpg)

## does displ affect cty? (dataset: mpg)
mpg %>% 
  ggplot(aes(x = displ, y = cty)) +
  geom_point()

test scor = hr + dinner + class + clothes


mod = glm(data = mpg,
          formula = cty ~ displ)

summary(mod)

str(mod)
mod$model
mod$model$cty

mod$coefficients
mod$fitted.values

mod$formula

plot(mod$model$cty, mod$fitted.values)
cor.test(mod$model$cty, mod$fitted.values)
cor.test(mpg$displ, mpg$cty)


mpg %>% 
  ggplot(aes(x = displ, y = cty)) +
  geom_point() +
  geom_smooth(method = 'glm')


y = -2.63x + 25.99

