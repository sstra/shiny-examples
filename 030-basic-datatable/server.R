# Load the ggplot2 package which provides
# the 'mpg' dataset.
library(ggplot2)

function(input, output) {

  
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
