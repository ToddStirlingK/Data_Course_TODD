# Assighnment #7

library(tidyverse)
library(ggplot2)
library(gganimate)

airl = read.csv('airlines.csv')
airp = read.csv('airports.csv')
janf = read.csv('jan_flights.csv')
jans = read.csv('Jan_snowfall.csv')


janf_2 = janf %>% 
  rename('iata' = 'ORIGIN_AIRPORT') %>% 
  unite('Date', YEAR, MONTH, DAY, sep = "-")

janf_2$Date = as.Date(janf_2$Date)

airl_2 = airl %>% 
  rename('AIRLINE_NAME' = 'AIRLINE',
         'AIRLINE' = 'IATA_CODE')

airp_2 = airp %>% 
  rename('iata' = 'IATA_CODE')

jans$Date = as.Date(jans$Date)


com = full_join(janf_2, jans)

com2 = full_join(com, airl_2)

com3 = full_join(com2, airp_2)

view(com3)


com3 %>% 
  summarise(av_dep_del = mean())
  ggplot(aes(x = Date,
             y = DEPARTURE_DELAY,
             color = STATE)) +
  geom_line()







