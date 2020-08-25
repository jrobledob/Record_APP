library(shiny)
library(readr)
url<- "https://raw.githubusercontent.com/jrobledob/Record_APP/master/Data/agrochemicals.csv"
data<- read_csv2(url(url))
data<- data[,-c(15:ncol(data))]
opciones<- c(data[,c(1,2,4,7:9)])
shinyUI(
  pageWithSidebar(
    headerPanel("Record APP"),
    sidebarPanel(
      selectizeInput("Criterio", "Seleccione el criterio principal debúsqueda",
                  choices = opciones, multiple = TRUE,  options = list(maxItems = 4)),
                     
      
                                         #                                    "Cultivo", "Nombre común de la peste", "Nombre científico de la peste")),
      
      # headerPanel("Seleccione el criterio de búsqueda"),
      # checkboxInput("Producto", "Producto", FALSE),
      # checkboxInput("IA", "Ingrediente Activo", FALSE),
      # checkboxInput("Uso", "Uso Agrícola", FALSE),
      # checkboxInput("Cultivo", "Cultivo", FALSE),
      # checkboxInput("Ncomun", "Nombre común", FALSE),
      # checkboxInput("Ncientifico ", "Nombre científico", FALSE),
      
     # selectInput("Criterio", "Seleccione el criterio principal de 
     #            búsqueda", choices = c("Producto", "Ingrediente activo","Uso agricola", 
     #                                    "Cultivo", "Nombre común de la peste", "Nombre científico de la peste")),
     # conditionalPanel(condition = "input.Producto == 1",
      #                 selectInput("producto", "seleccione el producto",choices= productos, selected = NA)),
     
     
      # conditionalPanel(condition = "input.Criterio == 'Producto'",
      #                  selectInput("primera_busqueda2", "seleccione el producto",choices= productos,selected = NA)),
      # conditionalPanel(condition = "input.Criterio == 'Uso agricola'",
      #                  selectInput("primera_busqueda3", "seleccione el uso",choices= uso, selected = NA)),
      # conditionalPanel(condition = "input.Criterio == 'Cultivo'",
      #                  selectInput("primera_busqueda4", "seleccione el cultivo",choices= cultivo, selected = NA)),
      # conditionalPanel(condition = "input.Criterio == 'Nombre común de la peste'",
      #                  selectInput("primera_busqueda5", "seleccione el nombre común de la peste",choices= comun, selected = NULL)),
      # conditionalPanel(condition = "input.Criterio == 'Nombre científico de la peste'",
      #                  selectInput("primera_busqueda6", "seleccione el nombre cientifico de la peste",choices= cientifico, selected = NA)),
      # 
      # conditionalPanel(condition = "input.Distribution == 'Exponential'",
      #                  textInput("Lamda", "Please select Exponential Lamda", 1))
     ),
    mainPanel(
      tableOutput("table")
    )
  )
)