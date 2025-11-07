# Ugly plot

library(readxl)

library(ggimage)

library(jpeg)

library(gganimate)

library(grid)

library(emojifont)

##

let = read_xls('Lettuce SH 012920.xls')

View(let)

let_spin = let %>%
  filter(
    leafpotassium > mean(leafpotassium, na.rm = T),
    leafcalcium > mean(leafcalcium, na.rm = T),
    leafmagnesium > mean(leafmagnesium, na.rm = T)
  )

view(let_spin)

image_path = '/Users/frog/Desktop/Data_Course_TODD/Assignments/Assignment_5/hq720.jpg'

##

mean(let$leafaluminum, na.rm = T)
max(let$leafaluminum, na.rm = T)

mean(let$leafpotassium, na.rm = T)
max(let$leafpotassium, na.rm = T)

##

load.emojifont("EmojiOne.ttf")

img = image_read2("/Users/frog/Desktop/Data_Course_TODD/Assignments/Assignment_5/spacecat.jpg")

img_grob <- rasterGrob(img, width = unit(1, "npc"), height = unit(1, "npc"))

catlazer$data = let_spin

catlazer = catlazer + transition_time(leafmagnesium)

catlazer = let_spin %>% 
  ggplot(aes(x = leafcalcium,
             y = leafpotassium)) +
  annotation_custom(img_grob, xmin = -Inf, xmax = Inf, 
                    ymin = -Inf, ymax = Inf) +
  geom_point() +
  geom_image(image = '/Users/frog/Desktop/Data_Course_TODD/Assignments/Assignment_5/hq720.jpg', 
             size = 0.2) +
  transition_time(leafmagnesium) +
  theme(plot.background = element_rect(fill = "magenta", color = NA),
        axis.title.x = element_text(color = "red3", size = 20),
        axis.title.y = element_text(color = "blue", size = 20),
        axis.text.x  = element_text(color = "yellow", size = 15),
        axis.text.y  = element_text(color = "green", size = 15),
        plot.title = element_text(
          color = "purple2",     
          size = 25,         
          face = "bold"      
        )) +
  labs(x = 'leafCATcium',
       y = 'leafPAWssium',
       title = 'leafMEOWesium: {frame_time}')


anim_save('cat_lazer.gif', animation = catlazer)


str(let_spin$leafzinc)







