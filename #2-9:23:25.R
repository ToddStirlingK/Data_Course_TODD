


## 9,23,25

list.files('data/', pattern = '^b', recursive =  T)

file = read.csv('Data/BioLog_Plate_Data.csv')
head(file, n = 1)

readLines('Data/BioLog_Plate_Data.csv', n = 1)


file_path = list.files('data/', pattern = '^b', recursive =  T)

setwd(/Users/frog/Desktop/Data_Course_TODD/Data)

for (number in 1) {
  out = readLines(file_path[number], n = 1)
  print(out)
  
}



## install and library tiderverse

library(tidyverse)


mtcars[mtcars$mpg > 20, ]

mtcars %>%. #pipe

mtcars %>% filter(mpg > 20) %>% view()


## 1. read 'clean_bird_data.csv'
## 2. calculate avg of egg size
## 3. save birds with egg size >avg
## 4. save in to a .csv file in laptop
## 5. read this csv file back to R again


## 1. 
read.csv('clean_bird_data.csv')

setwd('/Users/frog/Desktop/Data_Course_TODD/Data')

read.csv('cleaned_bird_data.csv')

## 2. 

cleanbird = read.csv('cleaned_bird_data.csv')

View(cleanbird)

cleanbird %>% mean(Egg_mass)

cleanbird %>% names()

#op1
mean(cleanbird$Egg_mass, na.rm = T)
#op2
cleanbird$Egg_mass %>% mean(na.rm = T)

# 3. 

largeegg = cleanbird %>%
  filter(Egg_mass > 21.8)

view(largeegg)

# 4.

write.csv(largeegg, 'largeegg.csv', row.names = F)

# 5. 



## install palmerpenguins

install.packages("palmerpenguins")

library(palmerpenguins)

penguins
?penguins


str(penguins)
dim(penguins)

peng = penguins


## 1. check colum names 
## 2. calculate max, min, ... of body mass

#. 1. 
names(peng)

# 2. 

max(peng$body_mass_g, na.rm = T)

peng$body_mass_g %>% max(na.rm = T)

peng$body_mass_g %>% min(na.rm = T)

peng %>% 
  pluck('body_mass_g') %>%
  max(na.rm = T)

## save file for female penguin with mody mass > avg


peng %>%
  filter(body_mass_g > 4201.5) %>%
  filter(sex == 'female')


peng %>%
  filter(body_mass_g > 4201.5 & sex == 'female') 
  

large_f = peng %>%
  filter(body_mass_g > 4201.5 & sex == 'female') 

view(large_f)  
  

# calculate body mass of female peng with bill length > 40
# seperate by species


peng$species

unique(peng$species)


peng_ade = peng %>%
  filter(species == 'Adelie') %>%
  filter(sex == 'female') %>%
  filter(bill_length_mm > 40) %>%
  mean(na.rm = T)

view(peng_ade)

#

peng_f_l_s = peng %>%
  filter(bill_length_mm > 40 & sex =='female') %>%
  group_by(species) %>%
  summarise(avg_mass_g = mean(body_mass_g),
            max_mass = max(body_mass_g),
            sample_size = n())

# do it myself


peng %>%
  filter(sex == 'female' & bill_length_mm > 40) %>%
  group_by(species) %>%
  summarise(avg_mass_g = mean(body_mass_g),
            )
  
  












  