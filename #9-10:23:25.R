# 10/23/25

## practice

wir = read.csv('Data/wide_income_rent.csv')

view(wir)

wir = as.data.frame(wir)

wir2 = wir[ ,-1]

view(wir2)

wir2 %>% 
  pivot_longer(col = everything())

# in class 

wir = read.csv('Data/wide_income_rent.csv')

view(wir)

wir %>% 
  pivot_longer(col = everything(),
               names_to = 'measure',
               values_to = 'value')

#cols = ''
#cols = c('thing1', 'thing2')
#cols = everything()
#cold = - ''

wir %>% 
  pivot_longer(col = - variable,
               names_to = 'measure',
               values_to = 'amount') %>% 
  pivot_wider(names_from = variable,
              values_from = amount)


# table cleanup

table1
table2

#table 2

table2 %>% 
  pivot_wider(names_from = type,
              values_from = count)
#table 3

table3

table3 %>% 
  separate(rate, c('cases', 'population'))

#table 4

table4a

table4b

new_table4a = table4a %>% 
  pivot_longer(col = - country, 
               names_to = 'year', 
               values_to = 'cases')

new_table4b = table4b %>% 
  pivot_longer(col = - country, 
               names_to = 'year', 
               values_to = 'population')

new_table4a
new_table4b

# full join needs at least one col to be the exsact same on both datasets

full_join(new_table4a, new_table4b)

#table 5

# paste()
#paste0() no space inbetween

table5

new_table5 = table5 %>% 
  mutate(year = paste0(century, year) %>% as.numeric()) %>% 
  separate(rate, c('cases', 'population'), convert = T) %>% 
  select(-century)

new_table5
  
# not as good
table5 %>% 
  mutate(year = paste0(century, year)) %>% 
  separate(rate, c('cases', 'population')) %>% 
  select(-century) %>% 
  pivot_wider(names_from = year, values_from = cases)

#


geom_smooth('loess')
# lm = 

Sys.time()
as.Date()
exam = '10/23/25'

as.Date(exam, format = )
as.Date('october-23-2025', format = '%d-%b-%y')

# reading excel?

library(readxl)

read_xlsx()

