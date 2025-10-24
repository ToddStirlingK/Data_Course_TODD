# 10/14/25

## practice:
## install "gapminder" and play with it

library(gapminder)

?gapminder

view(gapminder)


gap = gapminder

#

gap %>% 
  filter(continent == 'Asia') %>% 
  ggplot(aes(x = year,
             y = lifeExp,
             color = country)) +
  geom_point() +
  geom_line() 


#


gap %>% 
  group_by(continent) %>% 
  ggplot(aes(x = year,
             y = lifeExp,
             color = continent)) +
  geom_point() +
  geom_line() 


## in class

unique(gap$continent)


## make a good graph and save to local directory 


gap %>% 
  group_by(continent, year) %>% 
  summarise(lifeexp_mean_con = mean(lifeExp)) %>% 
  ggplot(aes(x = year,
             y = lifeexp_mean_con,
             color = continent)) +
  geom_point() +
  geom_line()

#

gap %>% 
  ggplot(aes(x = continent,
             y = lifeExp,
             fill = continent)) +
  geom_boxplot()

## ggpairs

ggpairs(gap)

## avg lifeexp by continent (did it)

gap %>% 
  group_by(continent, year) %>% 
  summarise(lifeexp_mean_con = mean(lifeExp)) %>% 
  ggplot(aes(x = year,
             y = lifeexp_mean_con,
             color = continent)) +
  geom_point() +
  geom_line() +
  transition_time(year) +
  labs(title = 'Year: {frame_time}')

## add population size

gap %>% 
  group_by(continent, year, pop) %>% 
  summarise(lifeexp_mean_con = mean(lifeExp)) %>% 
  ggplot(aes(x = year,
             y = lifeexp_mean_con,
             color = continent)) +
  geom_point(aes(size = pop)) +
  geom_line() 
  


## gganimate

library(gganimate)

p_1 = gap %>% 
  group_by(continent) %>% 
  ggplot(aes(x = year,
             y = lifeExp,
             color = continent)) +
  geom_point()

p_1 + transition_time(year) +
  labs(title = 'Year: {frame_time}')

anim_save('my_moving_plot.gif')

## online example

ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  ease_aes('linear')

# the fix 

library(gifski)
library(av)

# change x axis

gap %>% 
  ggplot(aes(x = gdpPercap,
             y = lifeExp,
             color = continent)) +
  geom_point() +
  transition_time(year) +
  labs(title = 'Year: {frame_time}')




## make cool animation graph (at home!)

view(gap)

gap %>% 
  group_by(continent, year, gdpPercap) %>% 
  #summarise(gdp_av_con = mean(gdpPercap))
  
  

  










