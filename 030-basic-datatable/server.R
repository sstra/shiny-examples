# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

function(input, output) {

  # An attempt to input the data as to subsequently download it
  #datasetInput <- reactive({
  
#    switch(input$man, input$man, input$trans, input$cyl)
    
    #switch(mpg, "man" = input$man, "trans" = input$trans, "cyl" = input$cyl)
    # Note: Attempts are reaching point of desperation and attempting code that will
    # clearly fail.
    
#    switch(input$mpg, "man" = mpg$manufacturer, "trans" = mpg$trans,
#           "cyl" = mpg$cyl
#    )
    
    
#    switch(input$man, "man" = c("All", unique(as.character(mpg$manufacturer))))
#    switch(input$trans, "trans" = c("All", unique(as.character(mpg$trans))))
#    switch(input$cyl, "cyl" =c("All", unique(as.character(mpg$cyl))))
#    switch(input$mpg, input$man, input$trans, input$cyl)
    
#           input$mpg2,
#           input$man,
#           input$trans,
#           input$cyl)

#           "man" = c("All", unique(as.character(mpg$manufacturer))),
#           "trans" = c("All", unique(as.character(mpg$trans))),
#           "cyl" = c("All", unique(as.character(mpg$cyl))))
          
           #"man" = man,
           #"trans" = trans,
           #"cyl" = cyl)
    
#    switch(input$mpg,
#           "man" = switch(input$man, c("All", unique(as.character(mpg$manufacturer)))),
#           "trans" = switch(input$trans, c("All", unique(as.character(mpg$trans)))),
#           "cyl" = switch(input$cyl, c("All", unique(as.character(mpg$cyl))))
#    )
    
#    switch(input$fluidRow,
#           "man" = man,
#           "trans" = trans,
#           "cyl" = cyl)

#    switch(input$mpg2, "man" = man, "trans" = trans, "cyl" = cyl)
#      switch(input$mpg, "man", "trans", "cyl")

 # })
  
  currentData <- reactive({
    data <- mpg
    if (input$man != "All") {
      data <- data[data$manufacturer == input$man,]
    }
    if (input$cyl != "All") {
      data <- data[data$cyl == input$cyl,]
    }
    if (input$trans != "All") {
      data <- data[data$trans == input$trans,]
    }
    data
  })
  
  #In MySQL, you will need to
  #    source Genes.sql
  #    source PubMut.sql

  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    currentData()
  }))
  
  # An attempt to download the data
  
  output$downloadData <- downloadHandler(
    "test.csv",
    content = function(file) {
      write.csv(currentData(), file, row.names = FALSE)  
    },
    contentType = "text/csv"
  )

}
