#8
# 10/21/25

gap = gapminder

## make cool animation graph (at home!)

view(gap)

pop = population

gap_gdp_ani = gap %>% 
  group_by(continent, year) %>% 
  summarise(gdp_av_con = mean(gdpPercap)) %>% 
  ggplot(aes(x = year,
             y = gdp_av_con,
             color = continent)) +
  geom_point(aes(size = pop)) +
  transition_time(year) +
  labs(title = 'Year: {frame_time}') 

anim_save()
  
##

gap %>% 
  ggplot(aes(x = gdpPercap,
             y = lifeExp,
             color = continent)) +
  geom_point() +
  transition_time(year) +
  labs(title = 'Year: {frame_time}') +
  geom_text(aes(label = country, vjust = 1.5, hjust = 1.5))


## 

cool_country = c('Kuwait', 'United States', 'Saudi Arabia', 
                 'Rawanda', 'Chile', 'Argentina')

unique(gap$country)

gap %>% 
  mutate(cool_country = case_when(country %in% cool_country ~ country))


gap %>% 
  mutate(cool_country = case_when(country %in% cool_country ~ country)) %>% 
  ggplot(aes(x = gdpPercap,
             y = lifeExp,
             color = continent)) +
  geom_point() +
  transition_time(year) +
  labs(title = 'Year: {frame_time}') +
  geom_text(aes(label = cool_country, vjust = 1.5, hjust = 1.5))


## leaflet

library(leaflet)

library(ggmap)

geocode('Utah Valley University')


## read wide_income_rent.csv
## plot by rent state

wir = read.csv('Data/wide_income_rent.csv')

view(wir)

## how to data clean!

# 1 observation per row >
# 1 veriable per column ^

## long way

wir_t = t(wir)

wir_t = as.data.frame(wir_t)

view(wir_t)

wir_t_2 = wir_t[-1, ]

view(wir_t_2)

colnames(wir_t_2) <- c('income', 'rent')

wir_t_2$state = rownames(wir_t_2)

wir_t_2 %>% 
  ggplot(aes(x = state,
             y = rent)) +
  geom_col() +
  theme(axis.text.x = element_text())

##

?pivot_longer
?pivot_wider

dat = data.frame(
  id = c(1, 2, 3),
  height = c(100, 200, 300),
  weight = c(150, 160, 107)
)

dat_bad = dat %>% 
  pivot_longer(col = c(height, weight),
               names_to = 'measure',
               values_to = 'value')

dat_bad %>% 
  pivot_wider(names_from = 'measure',
              values_from = 'value')

dat %>% 
  pivot_longer(col = everything(),
               names_to = 'measure',
               values_to = 'value')

## practice bad to good




