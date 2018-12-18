#install.packages("ggplot2")
#install.packages("maps")

library("ggplot2")
library(maps)

#tworzymy nowa palete
paleta1 <- colors()[c(507,648,413, 151,301,352,398,630, 634,40, 37,151,75,424, 78,622)]

#wczytujemy dane z NASA
dane <- read.csv("D:/programy/R/proj26.10.18/landslidesafterrainfall2007-16.csv")

#tworzymy wykres na mapie i dodajemy wczesniejsze dane
wykres<-map('state', fill = TRUE, col = paleta1) + points(dane$longitude, dane$latitude, col = "dodgerblue4", pch=17,cex=1.5)

#dodajemy podpis do mapy
wyk<-wykres + title(main = "Landslides after rainfall 2007-16")

#dodajemy podpis poprzez zmodyfikowana legende, poniewaz nie ma w mapach latwej opcji podpisu
legend("bottomright", legend="Source: NASA",bty = "n")



