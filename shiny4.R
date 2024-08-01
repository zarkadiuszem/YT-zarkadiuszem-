df <- iris
library(ggplot2)
library(dplyr)
library(shiny)
library(shinythemes)
library(psych)

ui <- fluidPage(theme = shinytheme("superhero"),  
                titlePanel(
                  h3('Testowanie normalności rozkładu "zarkadiuszem"')),
                sidebarLayout(
                  sidebarPanel(
                    h4("Wybór cech"),
                    selectInput("zmienna", 
                                label = "Wybierz cechę irysów",
                                choices = colnames(df[-5])),
                    
                    checkboxGroupInput("odmiana", "Wybierz odmianę irysów?",
                                       selected = as.vector(unique(iris$Species)),
                                       as.vector(unique(iris$Species))),
                    
                    sliderInput("bins", "Liczba słupków", value = 20, min = 1, max = 50),
                    width = 3  
                    
                    
                    
                    
                  ),
                  mainPanel(
                    h5("Charakterystyka rozkładu"),
                    fluidRow(
                      column(6, "Histogram", 
                             plotOutput("histogram",
                                        height = 300)),
                      column(6, "Wykres K-K", 
                             plotOutput("KK", 
                                        height = 300))),
                    fluidRow(
                      column(6, br(), "Statystyki opisowe",   
                             verbatimTextOutput("opis")),   
                      column(6, br(), "Test Shapiro-Wilka",
                             verbatimTextOutput("test"))
                      
                    ),
                    width = 9   
                  )
                ))


server <- function(input, output, session) {
  
  gatunek <- reactive({
    validate(
      need(input$odmiana != "", 
           "Wybierz przynajmniej jedną odmianę irysów aby wyświetlić wykres")
    )
    input$odmiana
  })
  
  output$histogram <- renderPlot({
    df %>%
      filter(Species %in% c(gatunek())) %>%   
      ggplot() +
      aes(get(input$zmienna), fill = Species) +
      geom_histogram(alpha = .5, bins = input$bins) +
      xlab(input$zmienna) +
      theme_minimal() +
      scale_fill_manual(values = c("#ad5c57", "#a6ad57", "#577bad")) +
      theme(text = element_text(size = 16))
  })
  output$KK <- renderPlot({
    df %>%
      filter(Species %in% c(gatunek())) %>%
      ggplot(aes(sample = get(input$zmienna))) +  
      stat_qq(shape = 1) +
      stat_qq_line() +
      ggtitle("Normal Q-Q Plot") +
      xlab("Theoretical Quantiles") + 
      ylab("Sample Quantiles") +
      theme_minimal()
    
  })
  output$opis <- renderPrint({
    print(df %>%
      filter(Species %in% c(gatunek())) %>%
      select(input$zmienna) %>%
      describe(ranges = F))
    df3 <- df %>%      # do pola statystyk dodajemy medianę 
      filter(Species %in% c(gatunek())) %>%
      select(input$zmienna) 
    mediana <- median(df3[,1])
    cat("median: ", 
        round(mediana, 4))
  })
  
  output$test <- renderPrint({
    df2 <- df %>%
      filter(Species %in% c(gatunek())) %>%
      select(input$zmienna)
    nasz.test <- shapiro.test(df2[,1])
    
    if (nasz.test$p.value < 0.05) {# dodajemy automatyczną interpretację testu
      cat("Należy odrzucić założenie\no normalności rozkładu\n")
    } else if (nasz.test$p.value >= 0.05) {
      cat("Nie ma podstaw do odrzucenia założenia\no normalności rozkładu\n")
    }
    
    cat("Prawdopodobieństwo testowe wynosi: ", 
          round(nasz.test$p.value, 4))
  })
  
}


shinyApp(ui, server)
