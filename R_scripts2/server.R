library(shiny)
library(readr)
url<- "https://raw.githubusercontent.com/jrobledob/Record_APP/master/Data/agrochemicals.csv"
data<- read_csv2(url(url))
data<- data[,-c(15:ncol(data))]
shinyServer(
  function(input, output, session) {
    output$table <- renderTable({
      criterio <- c(input$Criterio)
      print(criterio)
      cr1<- which(apply(data, 1, function(r) any(r %in% criterio[1])))
      cr2<- which(apply(data, 1, function(r) any(r %in% criterio[2])))
      cr3<- which(apply(data, 1, function(r) any(r %in% criterio[3])))
      cr4<- which(apply(data, 1, function(r) any(r %in% criterio[4])))
      selection<- Reduce(intersect, list(cr1,cr2,cr3,cr4))
      data[selection,]
    }
    )
  }
)