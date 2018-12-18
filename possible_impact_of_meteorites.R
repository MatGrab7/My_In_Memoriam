library(ggplot2)
library(gdata) 

#zgranie danych z pliku
dane <- read.csv("D:/programy/R/proj26.10.18/possible_impact_of_meteorites.csv")
liczba_wierszy<-nrow(dane)
liczba_probek <- 15
names(dane)

#losowanie probek
wiersze_losowe<-sample.int(liczba_wierszy, liczba_probek)
dane_losowe<-head(dane, n=liczba_probek)

#zastepujemy glowe danych, losowymi probkami
for (i in 1:liczba_probek){
  j<-wiersze_losowe[i]
  dane_losowe[i,]<-dane[j,]
}

#sortujemy dane, aby lepiej wygladaly na wykresie
dane_losowe<-dane_losowe[order(dane_losowe$Possible.Impacts), ] 

#szukamy maksymalnej wartosci wsrod wylosowanych
maksimum=max(dane_losowe$Possible.Impacts, na.rm = TRUE)
wiersz_maksimum=which.max(dane_losowe$Possible.Impacts)
print(wiersz_maksimum)

wykres_slupkowy<-ggplot(data=dane_losowe, aes(x=Object.Name, y=Possible.Impacts)) +
  geom_bar(stat="identity", fill = "dodgerblue3")+xlab("Asteroid name") + ylab("Level of impact") +
             ggtitle("Possible Asteroid Impact with Earth") + theme_bw() + labs(caption = "Source: NASA")

wykres_slupkowy