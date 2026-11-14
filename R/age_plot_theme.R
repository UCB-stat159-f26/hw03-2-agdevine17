age_plot_theme <- function() {
  ggplot2::theme_minimal() +
    ggplot2::theme(
      legend.position = "top", legend.title = ggplot2::element_blank(),
      legend.direction = "horizontal",
      plot.title = ggplot2::element_text(hjust = 0.5, face = "bold", size = 16),
      axis.title.x.top = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank()
    )
}
