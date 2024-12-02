#' Rank Regions by Attractiveness Score
#'
#' @param calculated_data A data frame with Attractiveness_Score.
#' @param top_n Number of top regions to return.
#' @return A ranked data frame.
#' @export
#' @importFrom utils head

rank_regions <- function(calculated_data, top_n = NULL) {
  if (!"Attractiveness_Score" %in% colnames(calculated_data)) {
    stop("Attractiveness_Score column is missing.")
  }
  ranked_data <- calculated_data[order(-calculated_data$Attractiveness_Score), ]
  if (!is.null(top_n)) {
    ranked_data <- head(ranked_data, n = top_n)
  }
  return(ranked_data)
}
