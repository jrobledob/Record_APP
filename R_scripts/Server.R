library(shiny)
library(readr)

shinyServer(
  function(input, output, session) {
    #
    my_list <- reactive({
      data <- read_csv2(url("https://raw.githubusercontent.com/jrobledob/Record_APP/master/Data/agrochemicals.csv"))$Producto
      my_list <- as.character(data)
      
    })
    #
    output$tree <- renderUI({
      selectInput(inputId = "tree", label = "Producto", choices = my_list())
    })
    #
    output$table <- renderTable(data[which(data$Producto==tree),])
    
  }
)