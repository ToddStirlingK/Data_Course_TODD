
library(tidyverse)
library(ggplot2)

mus = read.csv('../../Data/mushroom_growth.csv')

view(mus)

#2

mus %>% 
  ggplot(aes(x = Light,
             y = GrowthRate,
             color = Species)) +
  geom_point()

mus %>% 
  ggplot(aes(x = Nitrogen,
             y = GrowthRate,
             color = Species)) +
  geom_point()

mus %>% 
  ggplot(aes(x = Humidity,
             y = GrowthRate,
             color = Species)) +
  geom_point()
           
mus %>% 
  ggplot(aes(x = Temperature,
             y = GrowthRate,
             color = Species)) +
  geom_point()

#3

mod_l = glm(data = mus,
           formula = GrowthRate ~ Light)

mod_n = glm(data = mus,
            formula = GrowthRate ~ Nitrogen)

mod_h = glm(data = mus,
            formula = GrowthRate ~ Humidity)

mod_t = glm(data = mus,
            formula = GrowthRate ~ Temperature)

#4

pred_l = predict(mod_l, type = "response")

mean((mus$GrowthRate - pred_l)^2)


pred_n = predict(mod_n, type = "response")

mean((mus$GrowthRate - pred_n)^2)


pred_h = predict(mod_h, type = "response")

mean((mus$GrowthRate - pred_h)^2)


pred_t = predict(mod_t, type = "response")

mean((mus$GrowthRate - pred_t)^2)

#6

new_l = data.frame(Light = c(50, 100, 200))

pred_l_2 = predict(mod_l, newdata = new_l, type = "response")

#7

ggplot() +
  geom_point(data = mus, aes(x = Light, y = GrowthRate), color = "blue") +
  geom_line(data = new_l, aes(x = Light, y = pred_l_2), color = "red")


non = read.csv('../../Data/non_linear_relationship.csv')

view(non)






