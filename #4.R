
## convert this into 'pipe format'

max(round(iris$Sepal.Length), 0)

iris$Sepal.Length %>%
  round() %>%
  max()

# kaggle.com (Good data sets for assighnment #4)
# can find packages I could use on CRAN. Pacages could do it for me

peng %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = body_mass_g,
             y = bill_length_mm,
             color = sex,
             shape = island)) + 
  geom_point()
  
# ! = NOT

x = c(1, 2, 3, 4, NA)
is.na(x)
!is.na(x)

# filter = what we want to keep (select)

select()

peng %>%
  names()

view(peng[, -8])

peng %>%
  select(-c(year, island)) %>%
  mutate(year = 100) %>%
  view()

## graphs
# you can look up the ggplot cheat sheet

peng %>%
  filter(!is.na(sex)) %>%
  ggplot(aes(x = body_mass_g,
             y = bill_length_mm,
             color = sex,
             shape = island)) + 
  geom_point() +
  theme_dark() +
  theme(axis.text = element_text(angle = 180, face = 'italic'))

## make an interesting graph using peng data
## no geom_point()
view(peng)


peng %>%
  ggplot(aes(x = island,
             y = flipper_length_mm,
             color = island)) +
  geom_col() + 
  theme_dark() +
  scale_color_manual(values = c('blue', 'magenta', 'green'))

?geom_col


#

peng %>% 
  ggplot(aes(x = species,
             fill = island)) + 
  geom_bar(position = 'dodge') 

#ggsave('../mycoolplot.png')


peng %>% 
  ggplot(aes(x = species,
             fill = island)) + 
  geom_bar(position = 'dodge') +
  scale_y_continuous(limits = c(0,150))

## at home: make graph avg weight by peng species with standard diviation

peng = penguins

sum_peng = 
  peng %>%  
  group_by(species) %>% 
  summarise(
    mean_peng = mean(body_mass_g, na.rm = T),
    sd_peng = sd(body_mass_g, na.rm = T)
  )
  

sum_peng %>% 
  ggplot(aes(x = species,
             y = mean_peng,
             fill = species)) + 
  geom_col() + 
  geom_errorbar(aes(ymin = mean_peng - sd_peng,
                    ymax = mean_peng + sd_peng))













