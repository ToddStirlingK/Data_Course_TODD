
library(tidyverse)

rel = read.csv('Utah_Religions_by_County.csv')

rel2 = rel %>%
  pivot_longer(
    cols = -c(County, Pop_2010),
    names_to = "Religion",
    values_to = "Proportion"
  )

view(rel2)

#plots

rel2 %>%
  ggplot(aes(x = Pop_2010, y = Proportion)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~ Religion)

rel2 %>%
  ggplot(aes(x = Religion, y = Proportion)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~ County)

rel2 %>%
  filter(Religion == 'Non.Religious') %>% 
  ggplot(aes(x = Religion, y = Proportion)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~ County)


rel2 %>%
  filter(Religion %in% c("Non.Religious", "LDS", "Catholic")) %>% 
  ggplot(aes(x = Religion, y = Proportion)) +
  geom_point() +
  geom_smooth() +
  facet_wrap(~ County)

#1

# from what I see there does not seem to be a corolation between population size
# and proportion of religions. Though ther is an intersting spike of both LDS and
# Catholic proportions around 100,000

#2 

# from my interpritation the only corilatoin appears to be when religious population
# spikes, non-religious drops and vice versa. This typicly happens with LDS vs
# non-religious but also with catholic propaortions. 











