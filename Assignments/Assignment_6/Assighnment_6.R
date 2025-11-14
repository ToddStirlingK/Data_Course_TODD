
#assighnment 6

library(tidyverse)

dat <- read_csv("../../Data/BioLog_Plate_Data.csv")

view(dat)

#what do I do about this

dat_l = dat %>% 
  pivot_longer(cols = starts_with('Hr_'),
               names_to = 'time',
               values_to = 'Absorbance')

dat_m = dat_l %>% 
  mutate(medium = case_when(`Sample ID` == 'Clear_Creek' | 
                              `Sample ID` == 'Waste_Water' ~ 'Water',
                            `Sample ID` == 'Soil_1' | 
                              `Sample ID` == 'Soil_2' ~ 'Soil'))

dat_2 = dat_m %>% 
  mutate(time_2 = case_when(time == 'Hr_24' ~ 24,
                            time == 'Hr_48' ~ 48,
                            time == 'Hr_144' ~ 144))

view(dat_2)

dat_2 %>% 
  filter(Dilution == 0.1) %>% 
  ggplot(aes(x = time_2,
             y = Absorbance,
             color = medium)) +
  geom_smooth(se = F) +
  facet_wrap(~Substrate)

library(gganimate)

dat_2 %>% 
  filter(Substrate == 'Itaconic Acid') %>% 
  group_by(`Sample ID`, time_2, Dilution) %>% 
  summarise(mean_absorbance = mean(Absorbance)) %>% 
  ggplot(aes(x = time_2,
             y = mean_absorbance,
             color = `Sample ID`)) +
  geom_line() +
  facet_wrap(~Dilution) +
  transition_reveal(time_2)

str(dat_2)




