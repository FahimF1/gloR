#' Visualize Attractiveness Scores
#'
#' Creates a bar chart of attractiveness scores for all regions.
#'
#' @param data A data frame with Attractiveness_Score calculated.
#' @return A ggplot object showing the visualization.
#' @export
#' @importFrom ggplot2 ggplot aes geom_bar labs theme_minimal

visualize_scores <- function(data) {
  if (!"Attractiveness_Score" %in% colnames(data)) {
    stop("Attractiveness_Score column is missing. Please calculate scores first using calculate_attractiveness().")
  }
  
  ggplot2::ggplot(data, ggplot2::aes(x = stats::reorder(Region, -Attractiveness_Score), y = Attractiveness_Score)) +
    ggplot2::geom_bar(stat = "identity", fill = "blue") +
    ggplot2::labs(title = "Attractiveness Scores by Region", x = "Region", y = "Attractiveness Score") +
    ggplot2::theme_minimal()
}
