df <- iris
library(ggplot2)
library(dplyr)
library(shiny)
library(bslib)

ui <- page_sidebar(
  title = "Baza danych IRIS",
  sidebar = sidebar(selectInput("zmienna", label = "Wybierz cechę irysów",
                                choices = colnames(df[-5])),
                    checkboxGroupInput("odmiana", "Wybierz odmianę irysów?",
                                       selected = as.vector(unique(iris$Species)),
                                       as.vector(unique(iris$Species))),
                    bg = "lightgrey",
                    sliderInput("bins", "Liczba słupków", value = 20, min = 1, max = 50)),
  
  layout_columns(
    card(plotOutput("histogram")),
    card(plotOutput("ramka")),
    col_widths = c(6, 6)
    
  )
  
)


server <- function(input, output, session) {
  
  
  gatunek <- reactive({
    # zarządzanie błędem
    validate(
      need(input$odmiana != "", 
           "Wybierz przynajmniej jedną odmianę irysów aby wyświetlić wykres")
    )
    input$odmiana
  })
  
  
  output$histogram <- renderPlot({
    ggplot(df) +
      aes(get(input$zmienna), fill = Species) +
      geom_histogram(alpha = .5, bins = input$bins) +
      xlab(input$zmienna) +
      theme_minimal() +
      scale_fill_manual(values = c("#ad5c57", "#a6ad57", "#577bad")) +
      theme(text = element_text(size = 16))
  })
  output$ramka <- renderPlot({
    df %>%
      filter(Species == c(gatunek())) %>%
      ggplot() +
      aes(x = Species, y = get(input$zmienna)) +
      geom_boxplot(fill="#577bad", alpha=0.5) +
      ylab(input$zmienna) +
      theme_minimal() + 
      theme(text = element_text(size = 16))
  })
  
}

shinyApp(ui, server)
