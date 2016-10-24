library(shiny)
ui <- fluidPage(
  selectInput(inputId = "x", 
              label = "Select X Axis",
              choices = c("TV", "Radio", "Newspaper"),
              selected = "TV"),
  plotOutput("scatterplot")
)

data <- read.csv("Advertising.csv")

server <- function(input, output) {
  output$scatterplot <- renderPlot({
    plot(data[,input$x], data$Sales, xlab = input$x, ylab = "Sales")
  })
}

shinyApp(ui = ui, server = server)