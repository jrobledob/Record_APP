library(readr)
url<- "https://raw.githubusercontent.com/jrobledob/Record_APP/master/Data/agrochemicals.csv"
data<- read_csv2(url(url))
data<- data[,-c(15:ncol(data))]
c("Producto", "Ingrediente activo","Uso Agricola", 
  "Cat. Tox.", "Cultivo", "Nombre común", "Nombre científico")
Producto<- ""
dput(levels(as.factor(data$Producto)))
data[which(data$Producto=="ABACUS® SC"),]
