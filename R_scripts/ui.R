library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Record App"),
    sidebarPanel(
      uiOutput("tree")),
    mainPanel(
      tableOutput('table')
    )
  )
)