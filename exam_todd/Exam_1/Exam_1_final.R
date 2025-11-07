
#I
cov = read.csv('data/cleaned_covid_data.csv')

View(cov)

#II
A_states = cov[grepl("^A", cov$Province_State), ]

view(A_states)

#III
A_states %>% 
  ggplot(aes(x = Last_Update,
             y = Deaths)) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE) +
  facet_wrap(~ Province_State, scales = "free")

#IV

state_max_fatality_rate = cov %>%
  group_by(Province_State) %>%                         
  summarize(Maximum_Fatality_Ratio = max(Case_Fatality_Ratio, 
                                         na.rm = TRUE)) %>%
  arrange(desc(Maximum_Fatality_Ratio))             

#V

state_max_fatality_rate %>% 
  ggplot(aes(x = Province_State,
             y = Maximum_Fatality_Ratio)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 90)
        

#VI

cov_d = cov %>%
  group_by(Last_Update) %>%                              
  summarize(total_d = sum(Deaths, na.rm = TRUE))

cov_d %>% 
  ggplot(aes(x = Last_Update,
             y = total_d)) +
  geom_col()














