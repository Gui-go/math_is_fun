# R script - Simplest Shiny App

# Setup -------------------------------------------------------------------
# rm(list = ls())
gc()
options(encoding = "UTF-8", stringsAsFactors = F)

# Libraries ---------------------------------------------------------------

library(shiny)
library(ggplot2)

# UI ----------------------------------------------------------------------
ui <- fluidPage(
  fluidRow(
    column(3,
           sliderInput(
             inputId = "n_ui",
             label = "n:",
             min = 100,
             max = 50000,
             value = 1000,
             step = 100, 
             animate = T
           ),
           numericInput(
             inputId = "shape_ui", 
             label = "Shape", 
             value = 1,
             min = 1, 
             max = 30, 
             step = 1
           ),
           numericInput(
             inputId = "alpha_ui", 
             label = "Alpha", 
             value = 1,
             min = 0, 
             max = 1, 
             step = 0.1
           ),
           selectInput(
             inputId = "lncolor_ui", 
             label = "Background color", 
             choices = c("black", "white", "blue", "red", "magenta4"), 
             selected = "magenta4", 
             multiple = F
           ),
           selectInput(
             inputId = "bkcolor_ui", 
             label = "Background color", 
             choices = c("black", "white", "blue", "red"), 
             selected = "black", 
             multiple = F
           )
    ),
    column(9,
           plotOutput(outputId = "distPlot", width = "800px", height = "800px")
    )
  )
)

# Server ------------------------------------------------------------------
server <- function(input, output) {
  output$distPlot <- renderPlot({
    # t <- seq(0, 2*pi, length.out = 50)
    angle <- 13*pi/180
    # angle = input$angle_ui
    points <- input$n_ui
    # points <- input$points_ui
    t <- (1:points)*angle
    x <- sin(t)
    y <- cos(t)
    df <- data.frame(t, x, y)
    p <- ggplot(df, aes(x*t, y*t))
    p + geom_point(size = 80, alpha = input$alpha_ui, shape = input$shape_ui, color = input$lncolor_ui)+
      theme(legend.position="none",
            panel.background = element_rect(fill = input$bkcolor_ui),
            panel.grid=element_blank(),
            axis.ticks=element_blank(),
            axis.title=element_blank(),
            axis.text=element_blank())
  })
}

# App ---------------------------------------------------------------------
shinyApp(ui, server)
