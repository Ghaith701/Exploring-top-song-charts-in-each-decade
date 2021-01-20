library(shiny)
library("NLP")
library("tm") # for text mining
library("SnowballC") # for text stemming
library("RColorBrewer")
library("wordcloud")
library(ggplot2)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlotly({
    
    disType <- input$Decade1
    
    newFile <- "Primary data top 10.csv"
    myData <- read.csv(newFile, header = TRUE)
    
    finalTable <- table(myData$Genre_1, myData$decade)
    myfinal <- as.data.frame(finalTable)
    names(myfinal)[1] <- "Genre"
    names(myfinal)[2] <- "Decade"
    
    if(disType == "1958 - 1969"){
      plotdecade <- subset(myfinal, myfinal$Decade == "1958-1969" & myfinal$Freq > 1)
    }
    else if(disType == "1970 - 1979"){
      plotdecade <- subset(myfinal, myfinal$Decade == "1970-1979" & myfinal$Freq > 1)
    }
    else if(disType == "1980 - 1989"){
      plotdecade <- subset(myfinal, myfinal$Decade == "1980-1989" & myfinal$Freq > 1)
    }
    else if(disType == "1990 - 1999"){
      plotdecade <- subset(myfinal, myfinal$Decade == "1990-1999" & myfinal$Freq > 1)
    }
    else if(disType == "2000 - 2009"){
      plotdecade <- subset(myfinal, myfinal$Decade == "2000-2009" & myfinal$Freq > 1)
    }
    else if(disType == "2010 - 2018"){
      plotdecade <- subset(myfinal, myfinal$Decade == "2010-2018" & myfinal$Freq > 1)
    }
    else if(disType == "All decades"){
      plotdecade <- subset(myfinal, myfinal$Freq > 1)
    }
    
    print(
      ggplotly(
        ggplot(plotdecade, aes(y = Genre, x = Freq, height = 400,
                                      width = 600)) + geom_point(aes(size = Freq, col = Genre)) + xlab("Frequency")+ ylab("Genre type")
      )
    )
    
  })

  
  output$distPlot2 <- renderPlot({
    disType <- input$Decade
    size <- input$words
    
    if(disType == "1958 - 1969"){
      filePath <- "1 decade.txt"
    }
    else if(disType == "1970 - 1979"){
      filePath <- "2 decade.txt"
    }
    else if(disType == "1980 - 1989"){
      filePath <- "3 decade.txt"
    }
    else if(disType == "1990 - 1999"){
      filePath <- "4 decade.txt"
    }
    else if(disType == "2000 - 2009"){
      filePath <- "5 decade.txt"
    }
    else if(disType == "2010 - 2018"){
      filePath <- "6 decade.txt"
    }
    
    text <-readLines(filePath) # Load the data as a corpus and save a copy as 'input'
    input <- Corpus(VectorSource(text))
    
    docs <- tm_map(input, removeWords, stopwords("english"))
    
    dtm <- TermDocumentMatrix(docs)
    
    m <- as.matrix(dtm)
    
    v <- sort(rowSums(m),decreasing=TRUE)
    d <- data.frame(words = names(v),freq=v)
    nrow(d)
    head(d, 10)
    set.seed(1234)
    wordcloud(words = d$words, freq = d$freq, min.freq = 1,
              max.words=size, random.order=FALSE, rot.per=0.35, 
              colors=brewer.pal(8, "Dark2"))
  })

})
