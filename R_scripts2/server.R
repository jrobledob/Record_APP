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
      primera_busqueda2 <- input$primera_busqueda2
      primera_busqueda3 <- input$primera_busqueda3
      primera_busqueda4 <- input$primera_busqueda4
      primera_busqueda5 <- input$primera_busqueda5
      primera_busqueda6 <- input$primera_busqueda6
      print(criterio)
      print(primera_busqueda)
      print(primera_busqueda2)
      print(primera_busqueda3)
      print(primera_busqueda4)
      print(primera_busqueda5)
      print(primera_busqueda6)
      data[which(apply(data, 1, function(r) any(r %in% c(primera_busqueda)))),]
    }
    )
  }
)