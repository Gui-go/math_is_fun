

# WIP


if(!require(matlab)){install.packages("matlab")}

# https://engineering-shiny.org/matters.html
# 6.3.2.4

# Here are for example a visualization through the lens of various type of color blindness:
  
  # Function to generate the graph
  with_palette <- function(palette) {
    x <- y <- seq(-8 * pi, 8 * pi, len = 40)
    r <- sqrt(outer(x^2, y^2, "+"))
    z <- cos(r^2) * exp(-r / (2 * pi))
    filled.contour(z,
                   axes = FALSE,
                   color.palette = palette,
                   asp = 1
    )
  }
  
  With the jet.colors palette from {matlab} (Roebuck 2014)
  
  with_palette(matlab::jet.colors)