
#10/28/25

library(readxl)

mess = read_xlsx('Data/messy_bp.xlsx',
                 skip = 3)

view(mess)

mess = mess[-1, ]

# read specifics 
read_xlsx('worst.xlsx',
          sheet = 2, range = 'B1:G10')

# clean up 

mess %>% 
  select(-c('HR...9', 'HR...11', 'HR...13')) %>% 
  view()

#easier

mess %>% 
  select(-starts_with('HR'))

#

mess_bp = mess %>% 
  select(-starts_with('HR')) %>% 
  pivot_longer(cols = starts_with('BP'),
               names_to = 'visit',
               values_to = 'bp') %>% 
  mutate(visit = case_when(visit == 'BP...8' ~ 1,
                                 visit == 'BP...10' ~ 2,
                                 visit == 'BP...12' ~ 3)) %>% 
  separate(bp, c('sys', 'dia'), convert = T) 

view(mess_bp)

mess_hr = mess %>% 
  select(-starts_with('BP')) %>% 
  pivot_longer(cols = starts_with('HR'),
               names_to = 'visit',
               values_to = 'hr') %>% 
  mutate(visit = case_when(visit == 'HR...9' ~ 1,
                           visit == 'HR...11' ~ 2,
                           visit == 'HR...13' ~ 3))

view(mess_hr)

?combine

mess_comb = full_join(mess_bp, mess_hr)

view(mess_comb)

## combine all white races to 'White'

mess_w = mess_comb %>% 
  mutate(Race = case_when(Race == 'WHITE' | Race == 'Caucasian' ~ 'White',
                          TRUE ~ Race))

view(mess_w)

# | = or
# & = and

# remove spaces

library(janitor)

clean_names() # the 2 things we use in package
make_clean_names()


make_clean_names('# of cookies') #basicly replaces space with '_' and makes lower case

mess_3 = mess_w %>% 
  clean_names()

view(mess_3)


# combine date of birth

mess_4 = mess_3 %>% 
  mutate(birthday = as.Date(paste(month_of_birth, day_birth, year_birth, 
                          sep = '/'))) %>%
  select(-c(month_of_birth, day_birth, year_birth)) %>% 
  arrange(pat_id) %>% 
  mutate(new_id = rep(1:(nrow(mess_4)/3), each = 3))


rep(1:(nrow(mess_4)/3), each = 3)


view(mess_4)


# plot












