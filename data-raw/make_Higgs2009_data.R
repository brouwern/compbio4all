# #install.packages("tabulizer")
# #install.packages("tabulizerjars")
# #install.packages("rJava")
# #library("rJava")
# #library("tabulizer")
# list.files()
# f <- system.file("examples", "data.pdf", package = "tabulizer")
#
# # extract table from first page of example PDF
# tab <- extract_tables("extract_me.pdf", pages = 6)
#
# head(tab[[1]])
# str(tab)
#
# #write.csv(tab, file = "Higgs_2009_amino_acids_properties.csv")
#
# #http://www.imgt.org/IMGTeducation/Aid e-memoire/_UK/aminoacids/IMGTclasses.html
#
# fi. <- here::here("data-raw","Higgs_2009_amino_acids_properties.csv")
# aa <- read.csv(file =fi. )
#
# aa_chars_subset <- aa[c(1:20),c(3:18)]
# aa_chars <- aa[,]
#
# usethis::use_r("aa_chars_subset")
# usethis::use_data(aa_chars_subset,overwrite = TRUE)
#
#
# usethis::use_r("aa_chars")
# usethis::use_data(aa_chars,overwrite = TRUE)
#
#
#
# aa
#
# library(ggpubr)
# names(aa)
#
# ggboxplot(data = aa,
#           x = "volume.cat",
#           y = "MW.da ")
#
# ggscatter(data = aa,
#           x = "saaH2O",
#           y = "hydrophobe.34",
#           color= "charge",
#           shape = "charge",
#           add = "loess")
# ggscatter(data = aa,
#           x = "polarity",
#           y = "isoelectric.pt",
#           color= "charge",
#           shape = "charge")
#
# ggscatter(data = aa,
#           x = "hydrophobe.34",
#           y = "hydrophobe.35",
#           #color= "charge",
#           #shape = "charge",
#           add = "loess")
#
# summary(aa)
