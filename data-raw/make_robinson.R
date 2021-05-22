## code to prepare `DATASET` dataset goes here

file. <- here::here("data-raw","martin1995_life_history.csv")

martin1995 <- read.csv(file = file., skip = 1)


usethis::use_data(martin1995, overwrite = TRUE)

#usethis::use_r("martin1995")


# make_dateset_helpfile(dataset = martin1995,
#                       dataset_name = "martin1995")

