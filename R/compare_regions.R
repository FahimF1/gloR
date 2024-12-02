#' Compare Two Regions
#'
#' This function compares the attractiveness scores of two regions.
#'
#' @param data A data frame with Attractiveness_Score calculated.
#' @param region1 The first region to compare.
#' @param region2 The second region to compare.
#' @return A comparison message.
#' @export
compare_regions <- function(data, region1, region2) {
  if (!"Attractiveness_Score" %in% colnames(data)) {
    stop("Attractiveness_Score column is missing. Please calculate scores first using calculate_attractiveness().")
  }
  
  # Extract scores
  score1 <- data$Attractiveness_Score[data$Region == region1]
  score2 <- data$Attractiveness_Score[data$Region == region2]
  
  if (length(score1) == 0 | length(score2) == 0) {
    stop("One or both regions not found in the data.")
  }
  
  # Compare scores
  if (score1 > score2) {
    return(paste(region1, "is more attractive than", region2, "by a score of", round(score1 - score2, 3)))
  } else if (score1 < score2) {
    return(paste(region2, "is more attractive than", region1, "by a score of", round(score2 - score1, 3)))
  } else {
    return(paste(region1, "and", region2, "are equally attractive with a score of", round(score1, 3)))
  }
}
