# 10/7/25

## make graph avg weight by peng specis
## with standard diviation bar

peng = penguins

sum_peng = 
  peng %>%  
  filter(!is.na(sex)) %>%
  group_by(species, sex) %>% 
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

?geom_bar

## geom_bar

sum_peng %>% 
  ggplot(aes(x = species,
             y = mean_peng,
             fill = species)) + 
  geom_bar(stat = 'identity')  #< essecialy the same as geom_col

## sd other way

geom_errorbar(aes(ymin = mean(bodymass) - sd(bodymass)
                  ymax + mean(bodymass) + sd(bodymass)))

# to get rid of na

filter(!is.na(bodymass))

# customize error bar

sum_peng %>% 
  ggplot(aes(x = species,
             y = mean_peng,
             fill = sex)) + 
  geom_col(position = 'dodge') + 
  geom_errorbar(aes(ymin = mean_peng - sd_peng,
                    ymax = mean_peng + sd_peng),
                position = position_dodge(width = 0.9),
                width = 0.3) +
  scale_y_continuous(expand = c(0, 0))

# all tpgether


peng_graph = 
  peng %>%  
  filter(!is.na(sex), !is.na(body_mass_g)) %>%
  group_by(species, sex) %>% 
  summarise(
    mean_peng = mean(body_mass_g),
    sd_peng = sd(body_mass_g)
  ) %>%
  ggplot(aes(x = species,
             y = mean_peng,
             fill = sex)) + 
  geom_col(position = 'dodge') + 
  geom_errorbar(aes(ymin = mean_peng - sd_peng,
                    ymax = mean_peng + sd_peng),
                position = position_dodge(width = 0.9),
                width = 0.3) +
  scale_y_continuous(expand = c(0, 0)) +
  labs(title = 'Penguins!') +
  theme(plot.title = element_text(hjust = 0.5))  #< adding a title

## stack overflow works best as 'look up' helps


## make histogram of flipper length and body mass

peng_graph_2 = 
  peng %>%
  ggplot(aes(x = flipper_length_mm,
             y = body_mass_g,
             fill = sex)) + 
  geom_histogram(stat = 'identity', position = 'dodge', alpha = 0.5)


## 

peng_graph_2 = 
  peng %>%
  mutate(flipper_group = case_when(flipper_length_mm > 205 ~ 'Big flippers',
                                   TRUE ~ 'Small')) %>%
  ggplot(aes(x = flipper_group,
             y = body_mass_g,
             fill = species)) + 
  geom_histogram(stat = 'identity', position = 'dodge', alpha = 0.5)


#


peng %>%
  ggplot(aes(x = flipper_length_mm,
             y = body_mass_g,
             color = species)) + 
  geom_path() +
  geom_point(color = 'black') +
  stat_ellipse(level = 0.9) +
  geom_bin2d() 



## make a boxplot to show peng weight across years 

unique(peng$year)
str(peng)

peng %>%
  ggplot(aes(x = factor(year),
             y = body_mass_g,
             fill = species)) + 
  geom_boxplot() +
  geom_jitter(alpha = 0.5)


#

peng %>%
  ggplot(aes(x = body_mass_g,
             fill = species)) + 
  geom_density(alpha = 0.5) 

#

peng %>%
  ggplot(aes(x = body_mass_g,
             fill = species)) + 
  geom_histogram() 

