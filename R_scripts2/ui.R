library(shiny)
library(readr)
url<- "https://raw.githubusercontent.com/jrobledob/Record_APP/master/Data/agrochemicals.csv"
data<- read_csv2(url(url))
data<- data[,-c(15:ncol(data))]
productos<- levels(as.factor(data$Producto))
IA<- levels(as.factor(data$`Ingrediente activo`))
uso<- levels(as.factor(data$`Uso Agricola`))
cultivo<- levels(as.factor(data$Cultivo))
comun<- levels(as.factor(data$`Nombre común`))
cientifico<- levels(as.factor(data$`Nombre científico`))
shinyUI(
  pageWithSidebar(
    headerPanel("Record APP"),
    sidebarPanel(
      checkboxInput("Producto", "Producto", FALSE),
      checkboxInput("IA", "Ingrediente Activo", FALSE),
      checkboxInput("Uso", "Uso Agrícola", FALSE),
      checkboxInput("Cultivo", "Cultivo", FALSE),
      checkboxInput("Ncomun", "Nombre común", FALSE),
      checkboxInput("Ncientifico ", "Nombre científico", FALSE),
      
     # selectInput("Criterio", "Seleccione el criterio principal de 
     #            búsqueda", choices = c("Producto", "Ingrediente activo","Uso agricola", 
     #                                    "Cultivo", "Nombre común de la peste", "Nombre científico de la peste")),
      conditionalPanel(condition = "input.Producto == 1",
                       selectInput("producto", "seleccione el producto",choices= productos, selected = NA)),
     
     
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