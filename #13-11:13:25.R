#11/13/25

## does the body mass vary significant between penguin species?

peng = penguins

view(peng)

mod1 = glm(dat = peng, formula = body_mass_g ~ species)

summary(mod1)

# set control, change order

peng$species = relevel(peng$species, ref = 'Gentoo')

# or

peng$species = factor(peng$species, levels = c('Chinstrap', 'Gentoo', 'Adelie'))

# other than glm, lm

mod2 = lm(dat = peng, formula = body_mass_g ~ species)

summary(mod2)

# lm - only liniar data, not catigories

# logistic regression
# outcome = binary

view(peng)


## build a model to predict whether a bird is gentoo or not?


mod3 = glm(dat = peng, formula = is Gentoo or not (y/n) ~ predictors)


# 1. 1outome is binary (0/1, T/F, Y/N)

peng_2 = peng %>% 
  mutate(gentoo = case_when(species == 'Gentoo' ~ TRUE,
                            TRUE ~ FALSE))
  
view(peng_2)

# 2. fam

names(peng_2)

mod3 = glm(dat = peng_2, formula = gentoo ~ bill_length_mm + flipper_length_mm +
             body_mass_g + bill_depth_mm,
           family = "binomial")

summary(mod3)

# binomial give you prabability

# predict

peng_2$pred = predict(mod3, peng_2, type = 'response')

view(peng_2)

peng_2 %>% 
  ggplot(aes(x = body_mass_g, 
             y = pred, 
             colour = species)) +
  geom_point()

# worse model

mod4 = glm(dat = peng_2, formula = gentoo ~ body_mass_g, 
           family = "binomial")

peng_2$pred2 = predict(mod4, peng_2, type = 'response')

peng_2 %>% 
  ggplot(aes(x = body_mass_g, 
             y = pred2, 
             colour = species)) +
  geom_point()

# how acurate is the model?

peng_2 %>% 
  mutate(outcome = case_when(pred2 > 0.75 ~ 'Gentoo',
                             pred2 < 0.25 ~ 'Not Gentoo',
                             TRUE ~ 'Not Sure')) %>% view()

# how good did we do?

peng_2 = peng_2 %>% 
  mutate(outcome = case_when(pred2 > 0.75 ~ 'Gentoo',
                             pred2 < 0.25 ~ 'Not Gentoo',
                             TRUE ~ 'Not Sure')) %>% 
  mutate(compare = case_when(species == 'Gentoo' & outcome == 'Gentoo' ~ 'Correct',
                             species != 'Gentoo' & outcome == 'Not Gentoo' ~ 'Correct',
                             TRUE ~ 'Not correct'))
 
table(peng_2$species)
table(peng_2$outcome)
table(peng_2$compare)

accuracy = 292/(292+52)

# or

peng_2 %>% 
  mutate(outcome = case_when(pred2 > 0.75 ~ 'Gentoo',
                             pred2 < 0.25 ~ 'Not Gentoo',
                             TRUE ~ 'Not Sure')) %>% 
  mutate(compare = case_when(species == 'Gentoo' & outcome == 'Gentoo' ~ TRUE,
                             species != 'Gentoo' & outcome == 'Not Gentoo' ~ TRUE,
                             TRUE ~ FALSE)) %>% 
  pluck('compare') %>% 
  sum()/nrow(peng_2)

# or (not very important)

peng_2 %>% 
  mutate(outcome = case_when(pred2 > 0.75 ~ 'Gentoo',
                             pred2 < 0.25 ~ 'Not Gentoo',
                             TRUE ~ 'Not Sure')) %>%
  select(species, outcome) %>% 
  mutate(compare = case_when(species == 'Gentoo' & outcome == 'Gentoo' ~ TRUE,
                             species != 'Gentoo' & outcome == 'Not Gentoo' ~ TRUE,
                             TRUE ~ FALSE)) %>% 
  pluck('compare') %>% 
  sum()/nrow(peng_2)


## GradSchool_Admissions.csv 
## build model to predict whether get into grad school or not

grad = read.csv('Data/GradSchool_Admissions.csv')

view(grad)

mod_g = glm(dat = grad, formula = admit ~ gre + gpa + rank, 
           family = "binomial")





