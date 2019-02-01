#
# This is the server logic of a Shiny web application. 
# Displaying plots for Orange tree growth data.
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  data <- Orange
  data$Tree <- paste0("Tree ", data$Tree)
   
  output$plot <- renderPlot({
    
    # draw the scatter or line plot based on selected input
    g <- ggplot(data, aes(x=age, y=circumference)) + 
      labs(title = "Orange tree growth plot", x = "Age of tree", y="Circumference of tree")
    
    if (input$plotType == "l") {
      g <- g + geom_line(aes(colour=Tree), size=2)
    } else if (input$plotType == "p") {
      g <- g + geom_point(aes(fill=Tree), shape=24, size=8)
    }
    g
  })
  
  output$orangeOutput <- renderPrint({
    # print tree, age, circumference for selected area
    brushedPoints(data, input$brushPlot, xvar = "age", yvar = "circumference")
  })
  
})
