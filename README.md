# rslots

A slot machine simulator in R inspired by the example outlined in [Hands on R Programming](https://rstudio-education.github.io/hopr/project-3-slot-machine.html).

# Installing this package

```r
#install.packages("devtools")
devtools::install_github("benyamindsmith/rslots")
```

# Using this package

To play a game of slots, simply run:

```r
rslots::play()
```

To keep track of your balance assign it to a variable: 

```r
# Example
x<- rslots::play()
```

# Similar packages

- [casino](https://github.com/anthonypileggi/casino) - available games include poker, blackjack and slots. Additionally its possible to [track preformance](https://github.com/anthonypileggi/casino?tab=readme-ov-file#its-closing-time)
- [Rcade](https://github.com/RLesur/Rcade)- play much more advanced HTML5 games in the R console.
