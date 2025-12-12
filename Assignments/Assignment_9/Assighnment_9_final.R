
library(tidyverse)
library(easystats)
library(MASS)

grad = read.csv('../../Data/GradSchool_Admissions.csv')

view(grad)

mod_1 = glm(data = grad,
            formula = admit ~ gre)

mod_2 = glm(data = grad,
            formula = admit ~ gpa)

mod_3 = glm(data = grad,
            formula = admit ~ rank)

compare_performance(mod_1, mod_2, mod_3) %>% plot()

# graphs

grad %>% 
  ggplot(aes(x = gre,
             y = admit)) +
  geom_jitter(height = 0.05) +
  stat_smooth(method = "glm",
              method.args = list(family = "binomial"),
              se = TRUE) + 
  scale_y_continuous(limits = c(0, 1))

grad %>% 
  ggplot(aes(x = gpa,
             y = admit)) +
  geom_jitter(height = 0.05) +
  stat_smooth(method = "glm",
              method.args = list(family = "binomial"),
              se = TRUE) + 
  scale_y_continuous(limits = c(0, 1))

grad %>% 
  ggplot(aes(x = rank,
             y = admit)) +
  geom_jitter(height = 0.05) +
  stat_smooth(method = "glm",
              method.args = list(family = "binomial"),
              se = TRUE) + 
  scale_y_continuous(limits = c(0, 1)) +
  scale_x_reverse()








