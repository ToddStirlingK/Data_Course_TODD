
# find the fac peng w/ mass > 5000
# count how many are male and female
# return the max body mass for male and female
# add new column to peng data to tell whether ther're fat

peng = penguins
view(peng)

#1
peng %>%
  filter(body_mass_g > 5000)

#2

peng %>%
  filter(body_mass_g > 5000 & sex == 'male') %>%
  summarise(sample_size = n())

peng %>%
  filter(body_mass_g > 5000 & sex == 'female') %>%
  summarise(sample_size = n())

#3

peng %>%
  filter(body_mass_g > 5000 & sex == 'male') %>%
  summarise(max_g_m = max(body_mass_g))

peng %>%
  filter(body_mass_g > 5000 & sex == 'female') %>%
  summarise(max_g_f = max(body_mass_g))


## better way

peng %>%
  filter(body_mass_g > 5000) %>%
  group_by(sex) %>%
  summarize(no_bird = n(),
            max_weight = max(body_mass_g))


is.na(peng$sex)  

# ! = oposite

!is.na(peng$sex)

#

peng %>%
  filter(!is.na(sex)) %>%
  filter(body_mass_g > 5000) %>%
  group_by(sex) %>%
  summarize(no_bird = n(),
            max_weight = max(body_mass_g))


#old
peng$fat_or_not <- peng$body_mass_g > 5000

view(peng)

#tidy verse
iris %>%
  mutate(new_col = Sepal.Length*Sepal.Width) %>%
  view()

#case when
# if peng has body mass > 5000, thats fat
# condition ~ if condition is true, then do ...


peng %>%
  mutate(fatstat = case_when(body_mass_g > 5000 ~ 'fattie',
                             body_mass_g > 6000 ~ 'GIANT',
                             TRUE ~ 'skinny')) %>%
  view()


# TRUE ~ = everything else that isnt alredy grouped

#4 final

peng %>%
  group_by(sex) %>%
  mutate(fatt = case_when(body_mass_g > 6000 ~ 'BIG',
                          body_mass_g > 4000 ~ 'Mid',
                          TRUE ~ 'small')) %>%
  summarize(no_bird = n(),
            max_weight = max(body_mass_g),
            fatt) %>%
  view()

#arrange

peng %>%
  group_by(sex) %>%
  mutate(fatt = case_when(body_mass_g > 6000 ~ 'BIG',
                          body_mass_g > 4000 ~ 'Mid',
                          TRUE ~ 'small')) %>%
  summarize(no_bird = n(),
            max_weight = max(body_mass_g),
            fatt) %>%
  arrange()
  view()
  
  
### PLOTS  
install.packages('ggplot2')
library(ggplot2)  


ggplot(data = peng,
       aes(x = body_mass_g,
           y = bill_length_mm)) +
  geom_point()

#

empty_plot = ggplot(data = peng,
                    aes(x = body_mass_g,
                        y = bill_length_mm))

empty_plot + geom_point()  
  
## basic way to make graph

peng %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = body_mass_g,
             y = bill_length_mm,
             color = sex)) + 
  geom_point()

#
# viridis = colorblind freindly

peng %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = body_mass_g,
             y = bill_length_mm,
             color = sex,
             shape = island)) + 
  geom_point() +
  scale_color_viridis_d(option = 'rocket', alpha = 0.8)

# alpha = transparent (good for overlap)

# manul set color

peng %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = body_mass_g,
             y = bill_length_mm,
             color = sex,
             shape = island)) + 
  geom_point() +
  scale_color_manual(values = c("magenta3", "seashell"))

# the order of how you add the colors corisponds to the order of the variables 
#listed

#

peng %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = body_mass_g,
             y = bill_length_mm,
             color = sex,
             shape = island)) + 
  geom_point() +
  scale_color_manual(values = c("magenta2", "green3")) +
  scale_shape_manual(values = c(8, 11, 3)) +
  labs(x = "weight (g)",
       y = 'bill length (mm)',
       title = 'pneg graph!') +
  geom_smooth(se = T)



  
  
  
  
  
  
  
  



