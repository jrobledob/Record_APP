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
      selectizeInput("Criterio", "Seleccione el criterio principal de 
                  búsqueda", choices = c("Producto", "Ingrediente activo","Uso agricola", 
                                        "Cultivo", "Nombre común de la peste", "Nombre científico de la peste")),
      conditionalPanel(condition = "input.Criterio == 'Ingrediente activo'",
                       selectizeInput("primera_busqueda", "seleccione el ingrediente activo",choices= IA)),
      conditionalPanel(condition = "input.Criterio == 'Producto'",
                       selectizeInput("primera_busqueda", "seleccione el producto",choices= productos)),
      conditionalPanel(condition = "input.Criterio == 'Uso agricola'",
                       selectizeInput("primera_busqueda", "seleccione el uso",choices= uso)),
      conditionalPanel(condition = "input.Criterio == 'Cultivo'",
                       selectizeInput("primera_busqueda", "seleccione el cultivo",choices= cultivo)),
      conditionalPanel(condition = "input.Criterio == 'Nombre común de la peste'",
                       selectizeInput("primera_busqueda", "seleccione el nombre común de la peste",choices= comun)),
      conditionalPanel(condition = "input.Criterio == 'Nombre científico de la peste'",
                       selectizeInput("primera_busqueda", "seleccione el nombre cientifico de la peste",choices= cientifico)),
      
      conditionalPanel(condition = "input.Distribution == 'Exponential'",
                       textInput("Lamda", "Please select Exponential Lamda", 1))),
    mainPanel(
      tableOutput("table")
    )
  )
)