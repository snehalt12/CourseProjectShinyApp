#
# This is the user-interface definition of a Shiny web application.
# There are input type radio buttons added to select the type of plot to display.
# Display the data for the selected area.
#

library(shiny)

# Draw scatter or line plot based on selection
shinyUI(fluidPage(
  
  titlePanel("Developing Data Product - Course project"),
  
  # Sidebar with radio button input for type of plot
  sidebarLayout(
    sidebarPanel(
      radioButtons(inputId = "plotType", label = "Plot type", choices = c("Scatter"="p", "Line"="l")
      ),
      h3("Output Orange Data : "),
      verbatimTextOutput("orangeOutput")
    ),
    
    # Show a plot of the selected type
    mainPanel(
       plotOutput("plot", brush = brushOpts(
         id = "brushPlot"
       ))
    )
  )
))
