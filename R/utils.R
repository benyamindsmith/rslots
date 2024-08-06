get_symbols <- function(prob=c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52)) {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,
         prob = prob)
}

