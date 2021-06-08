# ---------------------------------------------
# Análisis espacial fuegos
# 4 Jun 2021
# Esteban Cañas-Murillo
# ---------------------------------------------

library(rgee)

ee_Initialize(email = 'ecanas44@gmail.com', drive = TRUE)
srtm <- ee$Image("USGS/SRTMGL1_003")

viz <- list(
  max = 4000,
  min = 0,
  palette = c("#000000","#5AAD5A","#A9AD84","#FFFFFF")
)

Map$addLayer(
  eeObject = srtm,
  visParams =  viz,
  name = 'SRTM',
  legend = TRUE
)
