library(shiny)
require(reshape, quietly=TRUE)
require(fpc, quietly=TRUE)

shinyServer(
  function(input, output) 
  {
    
    
    indata <- reactive({inputdf <- input$file
                        if (is.null(inputdf)) 
                          return (NULL)
                        else
                          read.csv(inputdf$datapath, header = TRUE,stringsAsFactors=FALSE)
                        
    })
    
    
    ##  Future utility Block   
    # inop <- reactive({if (is.null(input$n)) 
    #       ({as.numeric(3)})
    #       else
    #         ({as.numeric(input$n)})
    #     })
    
    
    observe({inputdf <- input$file
             if (is.null(inputdf)) 
               return (NULL)
             else
               name <<- inputdf$name
             datapath <<- inputdf$datapath
    })
    
    ##  nout <- reactive(quote({ifelse(is.null(input$n),3,input$n)}),quoted=TRUE)
    
    observe({
      if (is.null(indata())) 
        return (NULL)
      else 
      {{set.seed(123)
        kmean <- ({kmeans(sapply(na.omit(indata()), rescaler, "range"),as.numeric(input$n), nstart=25)})
        cluster <<- kmean$cluster
        size <<- kmean$size
        centers <<- kmean$centers
        down <<- cbind(indata(),kmean$cluster)}
      }})
    
    
    output$op1 <- renderPrint({
      if (is.null(indata())) 
        return (NULL)
      else
        name
    })
    
    
    ## File DataPath Utility       
    #       output$op2 <- renderPrint({
    #         if (is.null(indata())) 
    #           return (NULL)
    #         else
    #           datapath
    #       })
    
    output$op3 <- renderPrint({
      if (is.null(indata())) 
        return (NULL)
      else
        summary(indata())
    })
    
    
    output$ot1 <- renderTable({
      if (is.null(indata())) 
        return (NULL)
      else
        head(indata(),n=input$obs)
      
    })
    
    
    output$op4 <- renderPrint({
      if (is.null(indata())) 
        return (NULL)
      else
        str(indata())
    })
    
    
    output$opl1 <- renderPlot({
      if (is.null(input$n)) 
        return (NULL)
      else if (is.null(indata()))
        return (NULL)
      else
      {plotcluster(na.omit(indata()), cluster)
       title(main="Clustering Visualization",
             sub=paste(format(Sys.time(), "%Y-%b-%d %H:%M:%S"), Sys.info()["user"]))}
      
    }
    )
    
    
    
    output$op5 <- renderPrint({
      if (is.null(input$n)) 
        return (NULL)
      else if (is.null(indata()))
        return (NULL)
      else
        colMeans(sapply(na.omit(indata()), rescaler, "range"))
    })
    
    
    
    output$op6 <- renderPrint({
      if (is.null(input$n)) 
        return (NULL)
      else if (is.null(indata()))
        return (NULL)
      else
        paste(size, collapse=' ')
    })
    
    
    output$op7 <- renderPrint({
      if (is.null(input$n)) 
        return (NULL)
      else if (is.null(indata()))
        return (NULL)
      else
        centers
    })
    
    
    output$downloadData <- downloadHandler(
      filename = function() {paste(input$file, '_results.csv', sep='')},
      content = function(file) { write.csv(down, file) }
    )
    
    
  }
)
