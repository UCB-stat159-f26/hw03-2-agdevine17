# tennisage

`tennisage` is an R package that retrieves professional tennis players' career match data from Tennis Abstract and visualizes the age difference between players and their opponents through a scatterplot.

## Installation

Install the package directly from GitHub:

```r
install.packages("remotes")
remotes::install_github("UCB-stat159-f26/hw03-2-agdevine17")
```

Load the package:

```r
library(tennisage)
```

## Usage

### Retrieve career match data

Use `get_player_matches()` to retrieve and clean a player's career match data:

```r
serena <- get_player_matches("Serena Williams")
head(serena)
```

The function returns a data frame containing:

- `match_date`: Date of the match
- `result`: Match outcome (`W` or `L`)
- `opponent`: Opponent's name
- `player_age`: Player's age at the match
- `opponent_age`: Opponent's age at the match
- `age_difference`: Player's age minus opponent's age

The function can also retrieve data for other players:

```r
nadal <- get_player_matches("Rafael Nadal")
head(nadal)
```

### Create an age-difference plot

Use `plot_age_difference()` to visualize the match data:

```r
p <- plot_age_difference(serena)
print(p)
```

The scatter plot displays the player's age on the x-axis and the age difference between the player and their opponent on the y-axis. Points are colored by match outcome.

To save the plot:

```r
ggplot2::ggsave("serena-age-difference.png", p, width = 10, height = 7)
```

## Data Source

Career match data and player birth dates are retrieved from [Tennis Abstract](https://www.tennisabstract.com/).

## Testing

The package includes automated tests using `testthat`. Run the tests locally with:

```r
devtools::test()
```

Run the full package check with:

```r
devtools::check()
```

## Reflection

The main challenge for me when completing this project was generalizing the code from my previous
Serena Williams homework assignments to apply to any player. Additionally, writing the tests for
this project was challenging. Keeping track of everything the function had to do and handling error
cases was something new for me. The tests ended up being very helpful because it exposed errors or things
I didn't include in the code. Pretty much everything about this project was new to me, I had never created
a package, written documentation, or made function tests. But now I understand the mechanics of creating
a package and know what needs to be included. I tried to keep everything organized so my workflow could
be reproducible and make sense to someone using the package.
