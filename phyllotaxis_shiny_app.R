# R script - Simplest Shiny App

# Setup -------------------------------------------------------------------
# rm(list = ls())
gc()
options(encoding = "UTF-8", stringsAsFactors = F)

# Libraries ---------------------------------------------------------------

library(shiny)
library(ggplot2)
# install.packages("colourpicker")
library(colourpicker)


# UI ----------------------------------------------------------------------
ui <- fluidPage(
  fluidRow(
    column(3,
           numericInput(
             inputId = "n_ui", 
             label = "N", 
             value = 6000,
             min = 1, 
             max = 100000, 
             step = 100
           ),
           numericInput(
             inputId = "size_ui", 
             label = "Size", 
             value = 100,
             min = 1, 
             max = 100, 
             step = 1
           ),
           numericInput(
             inputId = "shape_ui", 
             label = "Shape", 
             value = 1,
             min = 1, 
             max = 25, 
             step = 1
           ),
           numericInput(
             inputId = "alpha_ui", 
             label = "Alpha", 
             value = 0.18,
             min = 0, 
             max = 1, 
             step = 0.1
           ),
           colourInput(
             inputId = "lncolor_ui", 
             label = "Linecolor", 
             value = "purple"
           ),
           colourInput(
             inputId = "bkcolor_ui", 
             label = "Background color", 
             value = "black"
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
    n <- input$n_ui
    t <- (1:n)*angle
    x <- sin(t)
    y <- cos(t)
    df <- data.frame(t, x, y)
    p <- ggplot(df, aes(x*t, y*t)) + 
      geom_point(size = input$size_ui, alpha = input$alpha_ui, shape = input$shape_ui, color = input$lncolor_ui)+
      theme(legend.position="none",
            panel.background = element_rect(fill = input$bkcolor_ui),
            panel.grid=element_blank(),
            axis.ticks=element_blank(),
            axis.title=element_blank(),
            axis.text=element_blank())
    return(p)
  })
}

# App ---------------------------------------------------------------------
shinyApp(ui, server)
