#' Calculate Attractiveness Score
#'
#' @param data A data frame with required columns.
#' @param weights A list of weights for each metric.
#' @return A data frame with Attractiveness_Score added.
#' @export
calculate_attractiveness <- function(data, weights = list(COL = 0.6, Visa = 0.4, Tax = 0.2, Dist = 0.2, Talent = 0.6)) {
  required_columns <- c("Cost_of_Living", "Visa_Ease", "Tax_Benefits", "Proximity", "Talent_Pool_Score")
  missing_columns <- setdiff(required_columns, colnames(data))
  if (length(missing_columns) > 0) {
    stop(paste("Missing required columns:", paste(missing_columns, collapse = ", ")))
  }
  
  data$Attractiveness_Score <- (
    (weights$COL / data$Cost_of_Living) +
      (weights$Visa * data$Visa_Ease) +
      (weights$Tax * data$Tax_Benefits) -
      (weights$Dist * data$Proximity) +
      (weights$Talent * data$Talent_Pool_Score)
  )
  return(data)
}
