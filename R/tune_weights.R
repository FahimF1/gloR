#' Tune Weights for Attractiveness Score
#'
#' Allows users to adjust weights and recalculate attractiveness scores.
#'
#' @param data A data frame with required columns for metrics.
#' @param weights A list of initial weights.
#' @return A data frame with recalculated Attractiveness_Score.
#' @export
#' @importFrom shiny shinyApp fluidPage titlePanel sidebarLayout sidebarPanel sliderInput mainPanel tableOutput renderTable

tune_weights <- function(data, weights = list(COL = 0.6, Visa = 0.4, Tax = 0.2, Dist = 0.2, Talent = 0.6)) {
  shiny::shinyApp(
    ui = shiny::fluidPage(
      shiny::titlePanel("Tune Weights"),
      shiny::sidebarLayout(
        shiny::sidebarPanel(
          shiny::sliderInput("COL", "Cost of Living Weight", min = 0, max = 1, value = weights$COL),
          shiny::sliderInput("Visa", "Visa Ease Weight", min = 0, max = 1, value = weights$Visa),
          shiny::sliderInput("Tax", "Tax Benefits Weight", min = 0, max = 1, value = weights$Tax),
          shiny::sliderInput("Dist", "Proximity Weight", min = 0, max = 1, value = weights$Dist),
          shiny::sliderInput("Talent", "Talent Pool Weight", min = 0, max = 1, value = weights$Talent)
        ),
        shiny::mainPanel(
          shiny::tableOutput("recalculated_scores")
        )
      )
    ),
    server = function(input, output) {
      output$recalculated_scores <- shiny::renderTable({
        updated_weights <- list(
          COL = input$COL,
          Visa = input$Visa,
          Tax = input$Tax,
          Dist = input$Dist,
          Talent = input$Talent
        )
        calculate_attractiveness(data, weights = updated_weights)
      })
    }
  )
}
