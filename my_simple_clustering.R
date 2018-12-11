library(ggplot2)
liczba_klastrow<-5
liczba_danych<-50

dane_losowe <- data.frame("x1"=runif(liczba_danych, 2.0, 7.5),"y1"=runif(liczba_danych, 1.0, 6.5),"klaster"=0)
centroidy <-data.frame("x1"=runif(liczba_klastrow, 2.0, 7.5),"y1"=runif(liczba_klastrow, 1.0, 6.5))


funkcja_euklidesowa <- function(x1,y1,x2,y2) {
  distance <- ((x1-x2)^2+(y1-y2)^2)^(1/2)
  return(distance)
}



for (i in 1:liczba_danych){
  min_odleglosc<-1000
  for (j in 1:liczba_klastrow){
    actual_distance<-funkcja_euklidesowa(dane_losowe$x1[i],dane_losowe$y1[i],centroidy$x1[j],centroidy$y1[j])
    if(actual_distance<min_odleglosc)
    {
      min_odleglosc<-actual_distance
      dane_losowe$klaster[i]<-j
    }
  }
  
}

draw1<-ggplot()+geom_point(data=dane_losowe, aes(x=x1, y=y1, color=klaster))+geom_point(aes(x = x1, y = y1), data = centroidy,size=3,shape=8)
draw1+scale_color_gradientn(colours = rainbow(liczba_klastrow))

