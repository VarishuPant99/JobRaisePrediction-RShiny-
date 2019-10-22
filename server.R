library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
  model <- reactive({
    brushed_data <- brushedPoints(attitude, input$BRUSH,
                                  xvar = "rating", yvar = "raises")
    if(nrow(brushed_data) < 2){
      return(NULL)
    }
    else{
    if(input$V%in%"")
    {
    lm(raises~rating,data=brushed_data)
    }
     else{
       pred<-input$V
      Pred<-brushed_data[,pred]
    lm(raises~rating+Pred,data=brushed_data)
    }}
      })

  output$slope <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][2]
    }
  })

  output$int <- renderText({
    if(is.null(model())){
      "No Model Found"
    } else {
      model()[[1]][1]
    }
  })

    output$FitPlot<-renderPlot({
      plot(attitude$rating,attitude$raises,
           ylab = "Raises",xlab="Rating", main = "Raises vs Rating",
           col="blue",pch=19,bty="n")
      if(!is.null(model())){
        abline(model(), col = "red",lwd=2.2)
      }
    })
})

