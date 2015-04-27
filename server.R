library(shiny)
library(png)
library(raster)
library(grid)
library(maps)
library(mapdata)


shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    red = input$Red / 255
    green = input$Green / 255
    blue = input$Blue / 255
    country = input$country
    par(mar=rep(0, 4))
    map('worldHires',country ,fill=TRUE, col=rgb(red, green, blue, 1))
    title(sprintf("Map of %s", country))
  })
})
