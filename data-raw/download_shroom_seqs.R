## code to prepare `shroom_table` dataset goes here

# Human shroom 3 (H. sapiens)
#install_github("ropensci/rentrez")
library(rentrez)
hShroom3 <- entrez_fetch(db = "protein",
                         id = "NP_065910",
                         rettype = "fasta")

# Mouse shroom 3a (M. musculus)
mShroom3a <- entrez_fetch(db = "protein",
                          id = "AAF13269",
                          rettype = "fasta")

# Human shroom 2 (H. sapiens)
hShroom2 <- entrez_fetch(db = "protein",
                         id = "CAA58534",
                         rettype = "fasta")


# Sea-urchin shroom
sShroom <- entrez_fetch(db = "protein",
                        id = "XP_783573",
                        rettype = "fasta")



usethis::use_r("hShroom3")
usethis::use_r("mShroom3a")
usethis::use_r("hShroom2")
usethis::use_r("sShroom")

usethis::use_data(hShroom3, overwrite = TRUE)
usethis::use_data(mShroom3a, overwrite = TRUE)
usethis::use_data(hShroom2, overwrite = TRUE)
usethis::use_data(sShroom, overwrite = TRUE)

