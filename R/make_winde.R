## code to prepare `wine` dataset goes here
wine <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data",
                   sep=",")
usethis::use_data(wine, overwrite = TRUE)
usethis::use_r("wine")
