library(shiny)
shinyUI(
  
  fluidPage(  
    
    titlePanel( 
      img(src="cluster_logo.png")             
    ),
    
    sidebarLayout(
      sidebarPanel(
        
        
        
        fileInput(inputId="file", 
                  label = h5("Load DataSet:"),
                  multiple = FALSE,
                  accept=c(".csv",".xlsx",".xls")
        ),
        
        numericInput(inputId = "obs", 
                     label = h5("No. of Observations to view:"),
                     3 , min = 3 , max = 30 , step = 1)
        
        
      ),
      
      
      
      mainPanel(
        
        tabsetPanel(
          tabPanel("Documentation",
                   h5("Elementary Cluster Analysis Tool"),
                   a("Slidify Presentation Link (RPubs)", 
                     href = "http://rpubs.com/mayankte/55551"),
                   br(),br(),
                   h6("Input Specifications:"),
                   p(".csv File Input with First Row specifying the
Variable Names and rest , carrying the Numeric Values for the Variables 
                    "),br(),
                   p("Note that ,the Tool considers all the Variables for Analysis,
                     thus One needs to remove the unwanted Columns like Primary_Keys,Record_Id etc "),
                   br(),
                   
                   h6("Example:"),
                   em("Var1,Var2,Var3"),br(),
                   em("2.4,3,9"),br(),
                   em("4.4,5,4"),br(),
                   em("2.3,2,4"),br(),
                   em("8.9,9,10"),br(),
                   em("7.9,4.2,5"),br(),br(),
                   h6("Output Specifications:"),
                   p("In Tab 2 and Tab 3, the tool summarizes the data and gives its
                     structure"),
                   p("In Tab 4, the user can select the number of Clusters he wants
                     to explore; by default it is set to 3 and minimum is 2 , thus
                     input csv file must have atleast 2 records apart from the first row"),
                   p("Tool will give Cluster Visualization , Cluster Sizes, Cluster Centres
                     and Raw Data means , along with summary n structure on other two Tabs"),
                   br(),
                   h6("Tool Covers Following:"),
                   p("1. widget : Data Loading(side panel), No. of DataPoints to show (side panel,output in tab 2),
                     Drop Down Cluster Selection (main panel,output in tab 4)"),
                   p("2. UI input operation: The results are produced on input data by the code in server.R file "),
                   p("3. Reactive Output : Summary,structure,Cluster Visualization , Cluster Size etc"),
                   p("4. Documentation : Now , what you are reading;Tab 1"),
                   p("5. Documentation embedded in the app with Slidify
                     Presentation Link;Tab 1"),
                   br()
          ),
          
          tabPanel("Data Summary",
                   h6("File Name"),
                   verbatimTextOutput('op1'),   
                   br()
                   ,
                   
                   h6("Summary"),
                   verbatimTextOutput('op3'),
                   br(),
                   
                   h6("Data Snippet"),
                   tableOutput('ot1'))
          
          ,
          
          tabPanel("Dataframe Structure",
                   h6("Structure"),
                   verbatimTextOutput('op4')
          ),
          
          tabPanel("Cluster Analysis",
                   selectInput("n",
                               label = h6("Enter the No. of Clusters :"), 
                               choices = list("2"= 2,
                                              "3" = 3, 
                                              "4" = 4, 
                                              "5" = 5,
                                              "6" = 6,
                                              "7"=7,
                                              "8"=8,
                                              "9"=9,
                                              "10"=10,
                                              "11"=11,
                                              "12"=12
                               ), 
                               selected = 3),
                   #                    numericInput(inputId="n", 
                   #                                 label = h6("Enter the No. of Clusters (Default = 3):"),
                   #                                 3 , min = 3
                   #                                 , max = 1000 , step = 1),
                   br(),
                   
                   
                   
                   h6("Cluster Plot"),
                   plotOutput('opl1'),
                   br(),
                   
                   h6("Mean Values"),
                   verbatimTextOutput('op5'),
                   br(),
                   
                   h6("Cluster Size"),
                   verbatimTextOutput('op6'),
                   br(),
                   
                   h6("Cluster Centres"),
                   verbatimTextOutput('op7'),
                   br(),
                   br(),
                   
                   
                   
                   
                   downloadButton('downloadData', h6('Download Results'))
                   
          ))
        
      )
      
    )
    
  ))
