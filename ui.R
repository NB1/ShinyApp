library(shiny)
library(png)
library(raster)
library(grid)
library(maps)
library(mapdata)
set.seed(as.numeric(Sys.time()))
countries = c("Finland", "Luxembourg", 
"UK", "India", "Pakistan", "China", 
"USA", "UK", "Iran", "Israel",
"Poland", "Denmark",
"Canada", "Australia", "Belgium", "Ireland",
"France", "Germany", "Hungary", "Iceland", "Japan", 
"Monaco", "Netherlands", 
"Sweden", "Switzerland", "USA")


github = "Github:  https://github.com/NB1/ShinyApp";  
line1 = "We select a random color and country initially.  ";
line2 = "You can change the color by sliding the three color ";
line3 = "bars for the 3 primary colors.  You can pick countries ";
line4 = "from the drop down box.  Any change will redraw the map. ";
line5 = "Note:  If a country has a very distant territory from mainland "
line6 = "(e.g. France, USA, UK) its map may appear very small.)"

paragraph = sprintf("%s %s %s %s %s %s", line1, line2, line3, line4, line5, line6);

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Show maps of countries"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("Red",
                  "Choose red in range [1,255]",
                  min = 1,
                  max = 255,
                  value = 255*runif(1)),
      sliderInput("Green",
                  "Choose green in range [1,255]",
                  min = 1,
                  max = 255,
                  value = 255*runif(1)),
      sliderInput("Blue",
                  "Choose blue in range [1,255]",
                  min = 1,
                  max = 255,
                  value = 255*runif(1)),
      selectInput(inputId = "country",
                  label = "Please Select a Country",
                  choices = sort(countries),
		  selected = sample(countries, 1),
		  multiple = FALSE
       )
    ),

    mainPanel(
      plotOutput("distPlot"),
      h2("Help for the application"),
      p(github),
      p(paragraph)
    )
  )
))
