library(shiny)
library(readr)
url<- "https://raw.githubusercontent.com/jrobledob/Record_APP/master/Data/agrochemicals.csv"
data<- read_csv2(url(url))
data<- data[,-c(15:ncol(data))]
shinyServer(
  function(input, output, session) {
    output$table <- renderTable({
      criterio <- input$Criterio
      primera_busqueda <- input$primera_busqueda
      print(criterio)
      print(primera_busqueda)
      data[which(apply(data, 1, function(r) any(r %in% c(primera_busqueda)))),]
    }
    )
  }
)