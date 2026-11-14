#' Plot Tennis Player Age Differences
#'
#' @param matches A data frame returned by get_player_matches().
#' @return A ggplot object showing age differences by match.
#' @export
#' @importFrom rlang .data
plot_age_difference <- function(matches) {
  matches$result <- factor(matches$result, levels = c("W", "L"))
  ggplot2::ggplot(matches, ggplot2::aes(x = .data$player_age, y = .data$age_difference, color = .data$result)) +
    ggplot2::geom_hline(yintercept = 0, color = "#999999", linewidth = 0.5) +
    ggplot2::geom_point(alpha = 0.6, size = 1.5) +
    ggplot2::scale_color_manual(values = c("W" = "#42C3E4", "L" = "#92368D"),
                                labels = c("Match won", "Match lost")) +
    ggplot2::scale_x_continuous(position = "top", breaks = scales::breaks_width(2)) +
    ggplot2::scale_y_continuous(breaks = c(-20, -10, 0, 10, 20),
                                labels = c("-20", "-10", "Same age", "+10", "+20 years")) +
    age_plot_theme()
}
