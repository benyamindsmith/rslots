#' Play Slots In R!
#'
#' A slot machine simulator in R. Based on the example outlined in \href{https://rstudio-education.github.io/hopr/project-3-slot-machine.html}{Hands on in R Programming}. The default configuration seems to have multiple plays (`n>1`) lead to being bankrupt. However it appears that setting the `betsize` larger leads to more profitable returns when using the default probabilities.
#'
#' @param n number of plays
#' @param cash amount of starting cash
#' @param betsize default is 1.
#' @param prob probabilities for getting diamonds (DD), 7s, bars (B,BB, BBB for single, double and triples),Cherries (C) and Zeros (0). Change the probabilities to change the odds of winning!
#' @examples
#' library(rslots)
#' res<- play(n=10, cash=100)
#' res
#' @export

play <- function(n = 1, betsize=1, cash = 10, prob= c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52)) {
  i <- 0
  while (cash >= betsize & i < n) {
    i <- i + 1
    cash <- cash - 1
    symbols <- get_symbols(prob)
    cat(symbols, "\n")
    if (symbols[1] == symbols[2] & symbols[2] == symbols[3]) {
      prize <- switch(
        symbols[1],
        "DD" = 100,
        "7" = 80,
        "BBB" = 40,
        "BB" = 25,
        "B" = 10,
        "C" = 10,
        "0" = 0
      )
    } else if (symbols[1] %in% c("B", "BB", "BBB") &
               symbols[2] %in% c("B", "BB", "BBB") &
               symbols[3] %in% c("B", "BB", "BBB")) {
      prize <- 5
    } else if ((symbols[1] == "C" &
                symbols[2] == "C") |
               (symbols[2] == "C" &
                symbols[3] == "C") | (symbols[1] == "C" & symbols[3] == "C")) {
      prize <- 5
    } else if (symbols[1] == "C" |
               symbols[2] == "C" | symbols[3] == "C") {
      prize <- 2
    } else{
      prize <- 0
    }

    diamonds <- sum(symbols == "DD")
    winnings <- (prize*betsize) * 2 ^ diamonds
    cash <- cash + winnings

    cat(paste0("$", winnings, " Won !\n"))

    cat(paste0("Balance: $", cash, "\n"))
  }
  return(cash)
}

