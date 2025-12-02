
library(tidyverse)

#1 

uni = read.csv('unicef-u5mr.csv')

View(uni)

#2

library(tidyverse)

uni2 = uni %>%
  pivot_longer(
    cols = starts_with("U5MR."),
    names_to = "Year",
    names_prefix = "U5MR.",
    values_to = "U5MR"
  ) %>%
  mutate(Year = as.integer(Year))

view(uni2)

#3

uni_plot_1 = uni2 %>% 
  ggplot(aes(x = Year,
             y = U5MR,
             group = CountryName)) +
  geom_line() +
  facet_wrap(~Continent)

#4

ggsave("Todd_Plot_1.png", plot = uni_plot_1)

#5

uni_mean = uni2 %>%
  group_by(Continent, Year) %>%
  summarize(mean_U5MR = mean(U5MR, na.rm = TRUE), .groups = "drop")

uni_plot_2 = uni_mean %>% 
  ggplot(aes(x = Year, 
             y = mean_U5MR, 
             color = Continent)) +
  geom_line()

#6

ggsave("Todd_Plot_2.png", plot = uni_plot_2)

#7

mod1 = glm(data = uni2,
           formula = U5MR ~ Year)

mod2 = glm(data = uni2,
           formula = U5MR ~ Year + Continent)

mod3 = glm(data = uni2,
           formula = U5MR ~ Year * Continent)

#8

library(easystats)

compare_performance(mod1, mod2, mod3) %>%  plot()

# from this comparison it seems that mod3 is the best model and mod1 is the worst
# in comparison. It is the best because it is most acurate on all fronts. 

#9

uni2$pred1 = predict(mod1, uni2)
uni2$pred2 = predict(mod2, uni2)
uni2$pred3 = predict(mod3, uni2)

view(uni2)

#p1
uni2 %>% 
  ggplot(aes(x = Year,
             pred1)) +
  geom_line() 

#p2
uni2 %>% 
  ggplot(aes(x = Year,
             pred2,
             group = Continent,
             color = Continent)) +
  geom_line() 

#p3
uni2 %>% 
  ggplot(aes(x = Year,
             pred3,
             group = Continent,
             color = Continent)) +
  geom_line() 


#10

ecuador_2020 = data.frame(
  Year = 2020,
  Continent = uni2$Continent[uni2$CountryName == "Ecuador"][1]
)

pred_ecuador_2020 <- predict(mod3, newdata = ecuador_2020)

real_ecuador_2020 <- 13

difference <- pred_ecuador_2020 - real_ecuador_2020

pred_ecuador_2020

difference









