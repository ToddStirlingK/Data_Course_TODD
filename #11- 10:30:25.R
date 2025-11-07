#10/30/25

#make a plot for BP data

view(mess_4)

mess_4 %>% 
  summarise(mean_hr = mean(hr)) %>% 
  ggplot(aes(x = race,
             y = mean_hr)) +
  geom_col()

  
##
  
mess_4 %>% 
  ggplot(aes(x = visit,
             color = race)) +
  geom_path(aes(y = sys)) +
  geom_path(aes(y = dia)) +
  facet_wrap(~ race)

mess_4 %>% 
  pivot_longer(c('sys', 'dia'), names_to = 'bp_type',
               values_to = 'bp') %>% 
  ggplot(aes(x = visit, y = bp, color = bp_type)) +
  geom_path() +
  facet_grid(sex ~ race)


bir = read.csv('Data/Bird_Measurements.csv')
view(bir)


# last cean up

library(skimr)

skim(bir)

nam = c('Family', 'Species_number', 'Species_name', 'English_name')

bir_m = bir %>% 
  select(nam, starts_with('M_'), -ends_with('_N')) %>% 
  mutate(sex = 'M')

view(bir_M)

bir_f = bir %>% 
  select(nam, starts_with('F_'), -ends_with('_N')) %>% 
  mutate(sex = 'F')

view(bir_F)

bir_u = bir %>% 
  select(nam, starts_with('un'), -ends_with('_N')) %>% 
  mutate(sex = 'U')


names(bir_m) = names(bir_m) %>% str_remove('M_')
names(bir_f) = names(bir_f) %>% str_remove('F_')
names(bir_u) = names(bir_u) %>% str_remove('Unsexed_')

bir_m %>% 
  full_join(bir_f) %>% 
  full_join(bir_u) %>% 
  view()





