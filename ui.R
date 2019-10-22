library(shiny)
library(ggplot2)
shinyUI(fluidPage(
  titlePanel("Fitting Regression Model on Chatterjee-Price Attitude Data"),
  sidebarLayout(
    sidebarPanel(
  h6("Choose Another predictor to convert this into a multiple linear regression model"),
       selectInput("V","Enter Extra Predictor",choices =list("","complaints","privileges","learning","critical","advance","")),
      h3("Slope"),
        textOutput("slope"),
h3("Intercept"),
textOutput("int")
  ),
    mainPanel(
      h3("Click and drag to select points on the graph"),
       plotOutput("FitPlot",brush=brushOpts(id="BRUSH")),
      h6("From a survey of the clerical employees of a large financial organization, the data are aggregated from the questionnaires of the approximately 35 employees for each of 30 (randomly selected) departments. The numbers give the percent proportion of favourable responses to seven questions in each department")
))))
