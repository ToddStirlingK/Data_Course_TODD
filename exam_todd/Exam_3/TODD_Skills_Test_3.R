
#1

library(tidyverse)
library(broom)

fac = read.csv('FacultySalaries_1995.csv')

view(fac)

names(fac)

fac_name = fac %>% 
  rename(Full = AvgFullProfSalary,
         Assoc = AvgAssocProfSalary,
         Assist = AvgAssistProfSalary)

view(fac_name)

fac_long = fac_name %>% 
  pivot_longer(cols = c(Full, Assoc, Assist),
               names_to = "Rank",
               values_to = "Salary")

view(fac_long)


fac_long %>% 
  filter(Tier != 'VIIB') %>% 
  ggplot(aes(x = Rank,
             y = Salary,
             fill = Rank)) +
  geom_boxplot() +
  facet_wrap(~ Tier) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))

#2

mod = lm(data = fac_long,
         Salary ~ State + Tier + Rank)

summary(mod)


#3

jun = read.csv('Juniper_Oils.csv')

View(jun)

jun_long = jun %>% 
  pivot_longer(cols = c("alpha.pinene","para.cymene","alpha.terpineol",
                        "cedr.9.ene","alpha.cedrene","beta.cedrene",
                        "cis.thujopsene","alpha.himachalene","beta.chamigrene",
                        "cuparene","compound.1","alpha.chamigrene","widdrol",
                        "cedrol","beta.acorenol","alpha.acorenol",
                        "gamma.eudesmol","beta.eudesmol","alpha.eudesmol",
                        "cedr.8.en.13.ol","cedr.8.en.15.ol","compound.2",
                        "thujopsenal"),
               names_to = 'ChemicalID',
               values_to = 'Concentration')

view(jun_long)

#4

jun_long %>% 
  ggplot(aes(x = YearsSinceBurn,
             y = Concentration)) +
  geom_smooth() +
  facet_wrap(~ ChemicalID, scales = "free_y")

#5

mod2 = jun_long %>% 
  group_by(ChemicalID) %>% 
  do(tidy(glm(Concentration ~ YearsSinceBurn, data = ., family = gaussian()))) %>%
  ungroup()

mod2

mod3 = mod2 %>% 
  filter(term == "YearsSinceBurn")

mod3

sig_mod = mod3 %>% 
  filter(p.value < 0.05)

sig_mod


