## code to prepare `shroom_table` dataset goes here

### Code for table
shroom_table <- c("CAA78718" , "X. laevis Apx" ,         "xShroom1",
                  "NP_597713" , "H. sapiens APXL2" ,     "hShroom1",
                  "CAA58534" , "H. sapiens APXL",        "hShroom2",
                  "ABD19518" , "M. musculus Apxl" ,      "mShroom2",
                  "AAF13269" , "M. musculus ShroomL" ,   "mShroom3a",
                  "AAF13270" , "M. musculus ShroomS" ,   "mShroom3b",
                  "NP_065910", "H. sapiens Shroom" ,     "hShroom3",
                  "ABD59319" , "X. laevis Shroom-like",  "xShroom3",
                  "NP_065768", "H. sapiens KIAA1202" ,   "hShroom4a",
                  "AAK95579" , "H. sapiens SHAP-A" ,     "hShroom4b",
                  #"DQ435686" , "M. musculus KIAA1202" ,  "mShroom4",
                  "ABA81834" , "D. melanogaster Shroom", "dmShroom",
                  "EAA12598" , "A. gambiae Shroom",      "agShroom",
                  "XP_392427" , "A. mellifera Shroom" ,  "amShroom",
                  "XP_783573" , "S. purpuratus Shroom" , "spShroom") #sea urchin

shroom_table <- data.frame(matrix(shroom_table,byrow = T, nrow = 14),
                           stringsAsFactors = F)
names(shroom_table) <- c("accession", "name.orig","name.new")

shroom_table$spp <- "Homo"
shroom_table$spp[grep("laevis",shroom_table$name.orig)] <- "Xenopus"
shroom_table$spp[grep("musculus",shroom_table$name.orig)] <- "Mus"
shroom_table$spp[grep("melanogaster",shroom_table$name.orig)] <- "Drosophila"
shroom_table$spp[grep("gambiae",shroom_table$name.orig)] <- "mosquito"
shroom_table$spp[grep("mellifera",shroom_table$name.orig)] <- "bee"
shroom_table$spp[grep("purpuratus",shroom_table$name.orig)] <- "sea urchin"

usethis::use_r("shroom_table")
usethis::use_data(shroom_table,overwrite = TRUE)

