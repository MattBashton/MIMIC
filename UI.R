## Matthew Basthon 2014-2016
## Shiny UI for test Sequenom classifier 

library(shiny) # load shiny at beginning at both scripts
library(shinythemes)
shinyUI(fluidPage(theme = shinytheme("united"),

  titlePanel("MIMIC: MInimal MethylatIon Classifier"), # give the interface a title 
  
  br(),
  sidebarLayout(
    
    sidebarPanel( # all the UI controls go in here
      width=3,
      fileInput('file1', 'MassARRAY® CSV file upload',
                accept=c('text/csv', 
                         'text/comma-separated-values,text/plain', 
                         '.csv')
      ),
      helpText("MIMIC will classify MassARRAY® medulloblastoma methylation data in to one of four molecular subgroups"),
      "Download test data to try classifier:", a(href="test_samples.csv", "Test CSV file", target="_blank")
    ), # End sidebarPanel
    
    
    mainPanel( # all of the output elements go here
      tabsetPanel(
        id = 'sequenom',
        tabPanel('Classification Table', dataTableOutput('classification_table'), br(), downloadButton('downloadClassification', 'Download'),p(), br(), textOutput("time")),
        #tabPanel('Classification Graph', plotOutput("classifierPlot", height = "640", width = "720"), br(), textOutput("time")),
        tabPanel('Classification Graph', plotOutput("classifierPlot", height = "640", width = "auto"), br(), downloadButton('PlotDownload', 'Download'), p()),
        tabPanel('Missing Probes Table', dataTableOutput('mp'), br(), downloadButton('downloadMissing', 'Download'), p()),
        tabPanel('Sample QC', br(), p(), textOutput("fs")),
        tabPanel('β-values', dataTableOutput('Beta'), br(), downloadButton('downloadBeta', 'Download'), p()),
        tabPanel('About',
                 h4("MIMIC version 3.3.4p"),
                 br(),
                 p(strong("Machine leanring and classifier code: "), a("Reza Rafiee", href="mailto:Gholamreza.Rafiee@newcastle.ac.uk?subject=Sequenom classifier website")),
                 p(strong("Shiny web code and adaptation: "), a("Matthew Bashton", href="mailto:matthew.bashton@newcastle.ac.uk?subject=Sequenom classifier website")),
                 p(strong("Project concept and sequenom file parser: "), a("Ed Schwalbe", href="mailto:ed.schwalbe@newcastle.ac.uk?subject=Sequenom classifier website")),
                 br(),
                 p("Insert blurb here")
        )
      ), # End of tabsetPanel
      br(),
      hr(),
      p("WARNING: MIMIC is for research use only, and should only be used on samples with a confirmed histopathalogical background of medulloblastoma."),
      hr(),
      img(src = "nicr.png"), img(src = "ncl.png"),
      br()
    ) # End of mainPanel
    
  ) # End sidebarLayout
  
) # End fluidPage

) # End shinyUI
