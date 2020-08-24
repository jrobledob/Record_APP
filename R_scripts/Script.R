library(readr)
url<- ""
data<- read.csv2("Data/agrochemicals.csv", encoding = 'UTF-8')
data<- data[,-c(15:ncol(data))]
