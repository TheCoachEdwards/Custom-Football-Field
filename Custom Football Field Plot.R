#####Read in libraries#####
library(png)
library(ggplot2)
font_import()
loadfonts(quiet = TRUE)
#####Read in Midfield & Conference Logo Images#####
mypngfile <- download.file('https://a.espncdn.com/i/teamlogos/ncaa/500/258.png', destfile = 'mypng.png', mode = 'wb')
mypng <- readPNG('mypng.png')

mypngACCLogo <- download.file('https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/ACC_logo_in_Virginia_colors.svg/200px-ACC_logo_in_Virginia_colors.svg.png', destfile = 'myACCLogo.png', mode = 'wb')
myACCLogopng <- readPNG('myACCLogo.png')

#####Add Any Custom Fonts You Want#####
font_add_google(name = "Libre Caslon Text", family = "caslon") ## This font was on google fonts
font_add(family = "Bodoni", regular = "Downloads/BodoniModa/static/BodoniModa-SemiBold.ttf") ##This font I needed to download and read in manually. But Now you can see both examples


#####Set up Data Frames for Diamond EndZones to call in ggplot#####
HomeDiamonds = data.frame(y=c(4.27,7.07,9.87,7.07, 9.87,12.67,15.47,12.67, 15.47,18.27,21.07,18.27, 21.07,23.87,26.67,23.87, 26.67,29.47,32.27,29.47, 32.27,35.07,37.87,35.07, 37.87,40.67,43.47,40.67, 43.47,46.27,49.07,46.27),
                      x=c(5,.5,5,9.5,5,.5,5,9.5,5,.5,5,9.5,5,.5,5,9.5,5,.5,5,9.5,5,.5,5,9.5,5,.5,5,9.5,5,.5,5,9.5),
                      t = c('a', 'a', 'a', 'a', 'b', 'b', 'b', 'b', 'c', 'c', 'c', 'c', 'd', 'd', 'd', 'd', 'e', 'e', 'e', 'e', 'f', 'f', 'f', 'f', 'g', 'g', 'g', 'g', 'h', 'h', 'h', 'h'))

AwayDiamonds = data.frame(y=c(4.27,7.07,9.87,7.07, 9.87,12.67,15.47,12.67, 15.47,18.27,21.07,18.27, 21.07,23.87,26.67,23.87, 26.67,29.47,32.27,29.47, 32.27,35.07,37.87,35.07, 37.87,40.67,43.47,40.67, 43.47,46.27,49.07,46.27),
                          x=c(115,110.5,115,119.5,115,110.5,115,119.5,115,110.5,115,119.5,115,110.5,115,119.5,115,110.5,115,119.5,115,110.5,115,119.5,115,110.5,115,119.5,115,110.5,115,119.5),
                          t = c('a', 'a', 'a', 'a', 'b', 'b', 'b', 'b', 'c', 'c', 'c', 'c', 'd', 'd', 'd', 'd', 'e', 'e', 'e', 'e', 'f', 'f', 'f', 'f', 'g', 'g', 'g', 'g', 'h', 'h', 'h', 'h'))
#####Set up Data Frames to call for letters and numbers in ggplot#####
HomeLettersDF = data.frame(x = c(5, 5, 5, 5, 5, 5, 5, 5), y = c(7.07, 12.67, 18.27, 23.87, 29.47, 35.07, 40.67, 46.27), Letter = c("V", "I", "R", "G", "I", "N", "I", "A"))
AwayLettersDF = data.frame(x = c(115, 115, 115, 115, 115, 115, 115, 115), y = c(7.07, 12.67, 18.27, 23.87, 29.47, 35.07, 40.67, 46.27), Letter = c("A", "I", "N", "I", "G", "R", "I", "V"))
FarFieldNumbers = data.frame(x= c(19.6,29.9,39.8,49.9,59.8,69.9,79.8,89.9,99.6), y = c(45.83, 45.83, 45.83, 45.83, 45.83, 45.83, 45.83, 45.83, 45.83), Number = c(10,20,30,40,50,40,30,20,10))
CloseFieldNumbers = data.frame(x= c(20.4,30.1,40.2,50.1,60.2,70.1,80.2,90.1,100.4), y = c(7.5,7.5,7.5,7.5,7.5,7.5,7.5,7.5,7.5), Number = c(10,20,30,40,50,40,30,20,10))

#####Create Football Field#####
football_field <- ggplot()+
  geom_rect(aes(xmin = -4, xmax = 124, ymin = -4, ymax = 57.33), fill = "#669933", colour = "#FFFFFF", size = .5) + ##These First few geom-rect's set up the field space
  geom_rect(aes(xmin = 0, xmax = 120, ymin = 0, ymax = 53.33), fill = "#669933", colour = "#FFFFFF", size = .5) +
  geom_rect(aes(xmin = 35, xmax = 85, ymin = -2, ymax = 0), fill = "#FFFFFF", colour = "#FFFFFF") + ##These next few set up the boxes around the field
  geom_rect(aes(xmin = 35, xmax = 85, ymin = 53.33, ymax = 55.33), fill = "#FFFFFF", colour = "#FFFFFF") +
  geom_rect(aes(xmin = -2, xmax = 35, ymin = -2, ymax = 0), fill = "#F84C1E") +
  geom_rect(aes(xmin = -2, xmax = 0, ymin = -2, ymax = 55.33), fill = "#F84C1E") +
  geom_rect(aes(xmin = -2, xmax = 35, ymin = 53.33, ymax = 55.33), fill = "#F84C1E") +
  geom_rect(aes(xmin = 120, xmax = 122, ymin = -2, ymax = 55.33), fill = "#F84C1E") +
  geom_rect(aes(xmin = 85, xmax = 122, ymin = -2, ymax = 0), fill = "#F84C1E") +
  geom_rect(aes(xmin = 85, xmax = 122, ymin = 53.33, ymax = 55.33), fill = "#F84C1E") +
  geom_segment(aes(x = 10, xend = 10, y = 0, yend = 53.33), colour = "#FFFFFF") + ##These are the yardmarkers
  geom_segment(aes(x = 15, xend = 15, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 29.8, xend = 29.8, y = 0, yend = 53.33), colour = "#232D4B") + ##These two are the blue lines around the 20 signifying the Red Zone
  geom_segment(aes(x = 30.2, xend = 30.2, y = 0, yend = 53.33), colour = "#232D4B") +
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
  geom_segment(aes(x = 89.8, xend = 89.8, y = 0, yend = 53.33), colour = "#232D4B") + ##These two are the blue lines around the 20 signifying the Red Zone
  geom_segment(aes(x = 90.2, xend = 90.2, y = 0, yend = 53.33), colour = "#232D4B") +
  geom_segment(aes(x = 90, xend = 90, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 95, xend = 95, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 100, xend = 100, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 105, xend = 105, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 110, xend = 110, y = 0, yend = 53.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 122, xend = 122, y = -2, yend = 55.33), colour = "#FFFFFF") +
  geom_segment(aes(x = -2, xend = -2, y = -2, yend = 55.33), colour = "#FFFFFF") +
  geom_segment(aes(x = -2, xend = 122, y = -2, yend = -2), colour = "#FFFFFF") +
  geom_segment(aes(x = -2, xend = 122, y = 55.33, yend = 55.33), colour = "#FFFFFF") +
  geom_segment(aes(x = 10, xend = 110, y = 20, yend = 20), colour = "#FFFFFF", linetype = "dashed") + ##These are the hashes
  geom_segment(aes(x = 10, xend = 110, y = 33.33, yend = 33.33), colour = "#FFFFFF", linetype = "dashed") +
  geom_segment(aes(x = 10, xend = 110, y = .5, yend = .5), colour = "#FFFFFF", linetype = "dashed") +
  geom_segment(aes(x = 10, xend = 110, y = 52.83, yend = 52.83), colour = "#FFFFFF", linetype = "dashed") +
  geom_segment(aes(x = 0, xend = 0, y=23.57, yend = 29.77), colour = "yellow", size = 1.3) + ## The next two lines are the FG Posts
  geom_segment(aes(x = 120, xend = 120, y = 23.57, yend = 29.77), colour = "yellow", size = 1.3) +
  geom_text(data = CloseFieldNumbers, mapping = aes(x,y, label = Number), colour = "#FFFFFF", size = 8, family = "Bodoni") + ##These are the Numbers on the field
  geom_text(data = FarFieldNumbers, mapping = aes(x, y, label = Number), colour = "#FFFFFF", size = 8, family = "Bodoni", angle = 180) +
  annotation_raster(mypng, ymin = 18, ymax = 35.5, xmin = 50, xmax = 70) + ##This is where you add the Midfield Logo
  annotation_raster(myACCLogopng, ymin = 12.67, ymax = 16, xmin = 81, xmax = 90) + ##Add ACC Logos
  annotation_raster(myACCLogopng, ymin = 37.33, ymax = 40.67, xmin = 31, xmax = 40) +
  geom_segment(aes(x = 13, xend = 13, y = 26.33, yend = 27), colour = "#FFFFFF") + ##Add the extra pt conversion mark
  geom_segment(aes(x = 107, xend = 107, y = 26.33, yend = 27), colour = "#FFFFFF") +
  geom_polygon(data=HomeDiamonds, mapping=aes(x=x, y=y, group = t), colour = "#232D4B", fill = "#FFFFFF") + ## Put in Diamond EndZones
  geom_polygon(data=AwayDiamonds, mapping=aes(x=x, y=y, group = t), colour = "#232D4B", fill = "#FFFFFF") +
  geom_text(data = HomeLettersDF, aes(x, y, label = Letter), colour = "#F84C1E", family = "caslon", size = 9, angle = 90) + ##Add Virginia to the Diamonds
  geom_text(data = AwayLettersDF, aes(x, y, label = Letter), colour = "#F84C1E", family = "caslon", size = 9, angle = 270) +
  theme(rect = element_blank(), ##This removes all of the exterior lines from a typical ggplot
        line = element_blank(),
        text = element_blank()) +
  ggsave("UVA Football Field.png", width = 12.8, height = 6.13)

football_field

#####
##Most colors used here are just white and green, but the orange on the outside of the field is UVA's orange##
##And is meant to mirror what the field looks like at Scott Stadium##