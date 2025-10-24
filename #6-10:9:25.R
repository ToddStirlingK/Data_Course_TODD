
## 10/9/25

# read /Data/DatasaurusDozen.tsv
# examine this dataset
# make a cool plot


setwd('/Users/frog/Desktop/Data_Course_TODD/')


doz = read_tsv('Data/DatasaurusDozen.tsv')

view(doz)


doz %>% 
  ggplot(aes(x = x, 
             y= y,
             color = dataset)) +
  geom_point() 



doz %>% 
  ggplot(aes(x = dataset, 
             y= y,
             fill = x)) +
  geom_col()


##

doz %>% 
  group_by(dataset) %>% 
  summarise(mean_x = mean(x),
            max_x = max(x),
            min_x = min(x),
            mean_y = mean(y),
            max_y = max(y),
            min_y = min(y))

#

doz %>% 
  ggplot(aes(x = x, 
             y= y,
             color = dataset)) +
  geom_point()

#

doz %>% 
  ggplot(aes(x = x,
             fill = dataset)) +
  geom_density(alpha = 0.5)

#

doz_plot = 
  doz %>% 
  ggplot(aes(x = x, 
             y= y,
             color = dataset)) +
  geom_point() + 
  facet_wrap(~ dataset)

## install 'GGally'

install.packages('GGally')
library(GGally)


ggpairs(doz)
ggpairs(penguins)


## recreation


peng = penguins


  
dupe_peng_plot = 
  peng %>% 
  filter(!is.na(sex)) %>% 
  ggplot(aes(x = bill_dep,
             y = body_mass,
             color = sex)) +
  geom_point(alpha = 0.5, size = 4) +
  facet_wrap(~ species) +
  scale_color_manual(values = c('purple4', 'green3')) +
  theme_bw() +
  labs(x = 'Bill Depth (mm)',
       y = 'Body Mass (g)') +
  theme(axis.title = element_text(face = 'bold', size = 12),
        strip.background = element_blank(),
        strip.text = element_text(face ='bold', size = 12))

## patchwork

install.packages('patchwork')
library(patchwork)

#V
  
dupe_peng_plot + doz_plot


## practice:
## install "gapminder" and play with it






