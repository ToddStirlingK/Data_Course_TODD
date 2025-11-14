#11/6/25

## build a model that predict cty as a function of dispersal
## 'mpg' dataset

view(mpg)

mod = glm(data = mpg,
          formula = cty ~ displ)

library(easystats)

report(mod)
performance(mod)
check_model(mod)

## build your own model to predict cty 

mod2 = glm(data = mpg,
           formula = cty ~ displ + manufacturer)

mod3 = glm(data = mpg,
           formula = cty ~ displ + cyl)

summary(mod1)

plot(mod1)

performance(mod1)

compare_performance(mod, mod2, mod3) %>%  plot()

#

mod5 = glm(data = mpg,
    formula = cty ~ displ * cyl)

summary(mod5)

compare_performance(mod, mod2, mod3, mod5) %>%  plot()


## mlu-explaAIn: gtreat way to learn differnt stats plots

# predict thr city based on 3 mods and save in mpg

mpg$pred1 = predict(mod, mpg)
mpg$pred2 = predict(mod2, mpg)
mpg$pred5 = predict(mod5, mpg)

view(mpg)

mpg %>% 
  ggplot(aes(x = displ, y = pred1, group = cyl, color = cyl)) +
  geom_smooth(method = 'glm')

mpg %>% 
  ggplot(aes(x = displ, y = pred2, group = cyl, color = cyl)) +
  geom_smooth(method = 'glm')

mpg %>% 
  ggplot(aes(x = displ, y = pred5, group = cyl, color = cyl)) +
  geom_smooth(method = 'glm')

mpg %>% 
  pivot_longer(starts_with('pred')) %>% 
  ggplot(aes(x = displ, y = cty, color = factor(cyl))) +
  geom_point() +
  geom_point(aes(y = value), color = 'navy') +
  facet_wrap(~ name)


# best mod

modf = glm(data = mpg,
           formula = cty ~ cyl * class)

compare_performance(mod, mod2, mod5, modf) %>%  plot()

mpg$pred_f = predict(modf, mpg)

mpg %>% 
  pivot_longer(starts_with('pred')) %>% 
  ggplot(aes(x = displ, y = cty, color = factor(cyl))) +
  geom_point() +
  geom_point(aes(y = value), color = 'navy') +
  facet_wrap(~ name)

#

library(MASS)
mod_all = glm(data = mpg, formula = cty ~ displ * cyl * trans * )
step = stepAIC(mod_all)
step$formula

mod_max = glm(data = mpg, formula = cty ~ .^2)
step_max = stepAIC(mod_max)



