#####Read in libraries#####
library(png)
library(ggplot2)

#####Read in Midfield Logo Image#####
mypngfile <- download.file('https://a.espncdn.com/i/teamlogos/ncaa/500/258.png', destfile = 'mypng.png', mode = 'wb')
mypng <- readPNG('mypng.png')

#####Create Football Field#####
football_field <- ggplot()+
  geom_rect(aes(xmin = -4, xmax = 124, ymin = -4, ymax = 57.33), fill = "#669933", colour = "#FFFFFF", size = .5) +
  geom_rect(aes(xmin = 0, xmax = 120, ymin = 0, ymax = 53.33), fill = "#669933", colour = "#FFFFFF", size = .5) +
  geom_rect(aes(xmin = 35, xmax = 85, ymin = -2, ymax = 0), fill = "#FFFFFF", colour = "#FFFFFF") +
  geom_rect(aes(xmin = 35, xmax = 85, ymin = 53.33, ymax = 55.33), fill = "#FFFFFF", colour = "#FFFFFF") +
  geom_rect(aes(xmin = -2, xmax = 35, ymin = -2, ymax = 0), fill = "#F84C1E") +
  geom_rect(aes(xmin = -2, xmax = 0, ymin = -2, ymax = 55.33), fill = "#F84C1E") +
  geom_rect(aes(xmin = -2, xmax = 35, ymin = 53.33, ymax = 55.33), fill = "#F84C1E") +
  geom_rect(aes(xmin = 120, xmax = 122, ymin = -2, ymax = 55.33), fill = "#F84C1E") +
  geom_rect(aes(xmin = 85, xmax = 122, ymin = -2, ymax = 0), fill = "#F84C1E") +
  geom_rect(aes(xmin = 85, xmax = 122, ymin = 53.33, ymax = 55.33), fill = "#F84C1E") +
  geom_segment(aes(x = 10, xend = 10, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 15, xend = 15, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 20, xend = 20, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 25, xend = 25, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 30, xend = 30, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 35, xend = 35, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 40, xend = 40, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 45, xend = 45, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 50, xend = 50, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 55, xend = 55, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 60, xend = 60, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 65, xend = 65, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 70, xend = 70, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 75, xend = 75, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 80, xend = 80, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 85, xend = 85, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 90, xend = 90, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 95, xend = 95, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 100, xend = 100, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 105, xend = 105, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 110, xend = 110, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 122, xend = 122, y = -2, yend = 55.33), colour = "#FFFFFF") +
  geom_segment(aes(x = -2, xend = -2, y = -2, yend = 55.33), colour = "#FFFFFF") +
  geom_segment(aes(x = -2, xend = 122, y = -2, yend = -2), colour = "#FFFFFF") +
  geom_segment(aes(x = -2, xend = 122, y = 55.33, yend = 55.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 10, xend = 110, y = 20, yend = 20), colour = "#FFFFFF", linetype = "dashed") +
  geom_segment(aes(x = 10, xend = 110, y = 33.33, yend = 33.33), colour = "#FFFFFF", linetype = "dashed") +
  geom_segment(aes(x = 10, xend = 110, y = .5, yend = .5), colour = "#FFFFFF", linetype = "dashed") +
  geom_segment(aes(x = 10, xend = 110, y = 52.83, yend = 52.83), colour = "#FFFFFF", linetype = "dashed") +
  geom_segment(aes(x=0, xend = 0, y=23.57, yend = 29.77), colour = "yellow", size = 1.3) +
  geom_segment(aes(x = 120, xend = 120, y = 23.57, yend = 29.77), colour = "yellow", size = 1.3) +
  annotate(geom ="text", x = 20.2, y = 7.5, label = "10", colour = "#FFFFFF", fontface = 2, size = 8) +
  annotate(geom ="text", x = 30, y = 7.5, label = "20", colour = "#FFFFFF", fontface = 2, size = 8) +
  annotate(geom ="text", x = 40, y = 7.5, label = "30", colour = "#FFFFFF", fontface = 2, size = 8) +
  annotate(geom ="text", x = 50, y = 7.5, label = "40", colour = "#FFFFFF", fontface = 2, size = 8) +
  annotate(geom ="text", x = 60, y = 7.5, label = "50", colour = "#FFFFFF", fontface = 2, size = 8) +
  annotate(geom ="text", x = 70, y = 7.5, label = "40", colour = "#FFFFFF", fontface = 2, size = 8) +
  annotate(geom ="text", x = 80, y = 7.5, label = "30", colour = "#FFFFFF", fontface = 2, size = 8) +
  annotate(geom ="text", x = 90, y = 7.5, label = "20", colour = "#FFFFFF", fontface = 2, size = 8) +
  annotate(geom ="text", x = 100.2, y = 7.5, label = "10", colour = "#FFFFFF", fontface = 2, size = 8) +
  annotate(geom ="text", x = 19.8, y = 45.83, label = "10", colour = "#FFFFFF", fontface = 2, angle = 180, size = 8) +
  annotate(geom ="text", x = 30, y = 45.83, label = "20", colour = "#FFFFFF", fontface = 2, angle = 180, size = 8) +
  annotate(geom ="text", x = 40, y = 45.83, label = "30", colour = "#FFFFFF", fontface = 2, angle = 180, size = 8) +
  annotate(geom ="text", x = 50, y = 45.83, label = "40", colour = "#FFFFFF", fontface = 2, angle = 180, size = 8) +
  annotate(geom ="text", x = 60, y = 45.83, label = "50", colour = "#FFFFFF", fontface = 2, angle = 180, size = 8) +
  annotate(geom ="text", x = 70, y = 45.83, label = "40", colour = "#FFFFFF", fontface = 2, angle = 180, size = 8) +
  annotate(geom ="text", x = 80, y = 45.83, label = "30", colour = "#FFFFFF", fontface = 2, angle = 180, size = 8) +
  annotate(geom ="text", x = 90, y = 45.83, label = "20", colour = "#FFFFFF", fontface = 2, angle = 180, size = 8) +
  annotate(geom ="text", x = 99.8, y = 45.83, label = "10", colour = "#FFFFFF", fontface = 2, angle = 180, size = 8) +
  annotation_raster(mypng, ymin = 18, ymax = 35.5, xmin = 50, xmax = 70) +
  theme(rect = element_blank(),
        line = element_blank(),
        text = element_blank())

football_field

#####
##Most colors used here are just white and green, but the orange on the outside of the field is UVA's orange##
##And is meant to mirror what the field looks like at Scott Stadium##