#LANDSAT Años anteriores
#Clasificacion de cobertura en imágenes
#Comparar 2016 con el mapa de Daniela y de Didi
#Analizar cambio de cobertura a traves de los años (animacion)
#Correlacionar la distribución de los fuegos con la cobertura
#La cantidad de hectareas quemadas baja en relacion al tipo de cobertura
#LLas zonas internas del parque se queman menos y las zonas del borde del parque se queman mas

# ---------------------------------------------
# Cobertura ACG Google Earth Engine
# 8 Jun 2021
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

img <- ee$Image("LANDSAT/LC08/C01/T1_SR/LC08_038029_20180810")$
  normalizedDifference(c("B5", "B4"))$
  pow(2)

dataset <- ee$ImageCollection('LANDSAT/LC08/C01/T1_SR')$select(c('B4', 'B3', 'B2'))
first <- dataset$first()

Map$setCenter(-85.59, 10.89, 11)
Map$addLayer(first)
