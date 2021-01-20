# ui.R
library(plotly)
library(shiny)
library(shinythemes)

shinyUI(fluidPage(
  theme = shinytheme("cosmo"),
  
  # Application title
  titlePanel("Top 50 Songs Each Decade"),
  navbarPage(title = "My project",
             tabPanel("About",
                      titlePanel("My app"), sidebarLayout(
                        sidebarPanel(
                          h3("Describtion: "),
                          h5("This application explores the top 50 songs in each decade in relation to the billboard 
                             songs data. The reason behind this application is to show the diversity and similarity 
                             in each decade. Two plots where made, Word Cloud plot and bubble chart plot.")
                        ),
                        mainPanel(
                          h3("Plots used: "),
                          h4("Word cloud"),
                          h5("Is a plotting method to show the most used words in a text.",br(), "In this application
                             , we explored the words of lyrics and showed the word cloud for each decade."),
                          br(),
                          h4("Bubble chart"),
                          h5("Is an intresting plotting method have many dimmensions to control, such as; color, 
                             size, etc",
                             br(), "In this application, we used the bubble chart to show the popularity of genres
                             in each decade."),
                          br(),
                          h3("Refrences: "),
                          h5("Application development by ",
                             HTML("<a href = 'https://shiny.rstudio.com/articles/'>shiny</a>")
                             ),
                          h5("Billboard Weekly Hot 100 singles chart between 8/2/1958 and 12/28/2018",
                             HTML("<a href = 'https://data.world/kcmillersean/billboard-hot-100-1958-2017'>Dataset</a>"), ".")
                        )
                      )
                    ),
             tabPanel("Lyrics",
                      # Sidebar with a slider input for the decade
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("Decade", "please select the decade", choices = c("1958 - 1969", "1970 - 1979",
                                                                                        "1980 - 1989", "1990 - 1999",
                                                                                        "2000 - 2009", "2010 - 2018")),
                          br(),
                          sliderInput("words",
                                      "Number of words",
                                      min = 50,
                                      max = 200,
                                      value = 100)
                        ),
                        
                        # Show two plots in deffirent tabs
                        mainPanel(
                          h3("Most used words for decades"),
                          plotOutput("distPlot2", width = "100%", height = "500px"),
                          h5("This plot shows most used words for each decade inside of a word cloud.", align = "center")
                        )
                      )),
             tabPanel("Genre",
                      # Sidebar with a slider input for the decade
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("Decade1", "please select the decade", choices = c("1958 - 1969", "1970 - 1979",
                                                                                        "1980 - 1989", "1990 - 1999",
                                                                                        "2000 - 2009", "2010 - 2018",
                                                                                        "All decades"))
                          ),
                        
                        # Show two plots in deffirent tabs
                        mainPanel(
                          h3("Songs count for decades"),
                          plotlyOutput("distPlot", width = "100%", height = "500px")
                          
                          )
                        
                      )))
  )
)