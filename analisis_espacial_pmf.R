# ---------------------------------------------
# Análisis espacial fuegos
# 4 Jun 2021
# Esteban Cañas-Murillo
# ---------------------------------------------

library(tidyverse)
library(sf)
library(tmap)
library(sp)
library(datasets)
library(ggplot2)

incendios <- read.csv(file = './incendios.csv')
head(incendios)
rownames(incendios)
str(incendios)
nrow(incendios)

incendios_long = pivot_longer(incendios, fid)
incendios_wide = pivot_wider(incendios)

incendios_gt1 = subset(incendios, AREA_m2 > 1)

#Boxplot incendios por año
ggplot(incendios_gt1, aes(x=factor(ANO), y=log(AREA_m2))) +
  geom_boxplot() +
  stat_summary(fun = "mean", geom = "point", shape = 23, size = 1.5, fill = "white")

#Violin  plot incendios por año
ggplot(incendios_gt1, aes(x=factor(ANO), y=log(AREA_m2))) + geom_violin() + 
  geom_boxplot(width=.05, fill="black") +
  stat_summary(fun = "mean", geom = "point", shape = 23, size = 1.5, fill = "white")

#Bar plot incendios por año
ggplot(incendios, aes(x=factor(ANO), fill=factor(ANO))) + geom_bar() +
  scale_fill_hue(c = 40) + 
  geom_text(stat="count", aes(label=..count..), position=position_dodge(width=0.9), vjust=-0.25) +
  theme(legend.position="none")

ano_2020 <- subset(incendios, ANO == 2020)
unique(incendios$ANO)
tb <- tibble(incendios$PARQUE_NAC, incendios$ANO, incendios$AREA_m2)

nc <- st_read(system.file("shape/nc.shp", package= "sf"), quiet = T)
qtm(nc)
