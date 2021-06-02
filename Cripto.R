##DIRECTORIO
setwd("C:/Users/peral/Desktop/Vanessa")



##INSTALACION PAQUETES
if(!require("tidyverse")) {
  install.packages("tidyverse")
  library("tidyverse")
}



if(!require("ggplot2")) {
  install.packages("ggplot2")
  library("ggplot2")
}



##IMPORTACION DE DATOS



df <- read.csv("crypto-markets.csv", sep=",", dec=".", quote = "\"'",
               header=TRUE, skip = 0, na.strings = "NA")



##ANALISIS DESCRIPTIVO
str(df, max.level=NA)



#No existen valores NA en los datos
#Decidimos cambiar symbol, name, slug y ranknow de char a factor
#Decidimos que la variable date sea de tipo fecha



df$symbol <- as.factor(df$symbol)
df$ranknow <- as.factor(df$ranknow)
df$name <- as.factor(df$name)
df$slug <- as.factor(df$slug)
df$date <- as.Date(df$date)



summary(df)



##ANALISIS EXPLORATORIO



##GRAFICOS
df_BTC <- df[1:2042,]
ggplot(df_BTC,aes(x=date, y=market), symbol="BTC") + geom_point()



ggplot(df[df$symbol=="BTC",],aes(x=date, y=market), symbol="BTC") + geom_point()





#analizar cada variable por separado, su frecuencia y tal
#analizar variables entre ellas, giterrin, gitmap, dispersion, graficos de caja
#modelo de regresion y prediccion