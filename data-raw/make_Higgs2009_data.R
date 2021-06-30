aa        <-c('A','C','D','E','F','G','H','I','K','L','M','N','P','Q','R','S','T','V','W','Y')
MW.da     <-c(89,121,133,146,165,75,155,131,146,131,149,132,115,147,174,105,119,117,204,181)
volume    <-c(67,86,91,109,135,48,118,124,135,124,124,96,90,
              114,148,73,93,105,163,141)
bulkiness <-c(11.5,13.46,11.68,13.57,19.8,3.4,13.69,21.4,
              15.71,21.4,16.25,12.28,17.43,
              14.45,14.28,9.47,15.77,21.57,21.67,18.03)
polarity  <-c(0,1.48,49.7,49.9,0.35,0,51.6,0.13,49.5,0.13,
              1.43,3.38,1.58,3.53,52,1.67,1.66,0.13,2.1,1.61)
isoelectric.pt <-c(6,5.07,2.77,3.22,5.48,5.97,7.59,6.02,9.74,5.98,
                   5.74,5.41,6.3,5.65,10.76,5.68,6.16,5.96,5.89,5.66)
hydrophobe.34 <-c(1.8,2.5,-3.5,-3.5,2.8,-0.4,-3.2,4.5,-3.9,3.8,1.9,
                  -3.5,-1.6,-3.5,-4.5,-0.8,-0.7,4.2,-0.9,-1.3)
hydrophobe.35 <-c(1.6,2,-9.2,-8.2,3.7,1,-3,3.1,-8.8,2.8,3.4,-4.8,
                  -0.2,-4.1,-12.3,0.6,1.2,2.6,1.9,-0.7)
saaH2O       <-c(113,140,151,183,218,85,194,182,211,180,204,158,
                 143,189,241,122,146,160,259,229)
faal.fold    <-c(0.74,0.91,0.62,0.62,0.88,0.72,0.78,0.88,0.52,
                 0.85,0.85,0.63,0.64,0.62,0.64,0.66,0.7,0.86,0.85,0.76)
polar.req    <-c(7,4.8,13,12.5,5,7.9,8.4,4.9,10.1,4.9,5.3,10,
                 6.6,8.6,9.1,7.5,6.6,5.6,5.2,5.4)
freq        <-c(7.8,1.1,5.19,6.72,4.39,6.77,2.03,6.95,6.32,
                10.15,2.28,4.37,4.26,3.45,5.23,6.46,5.12,7.01,1.09,3.3)
charge<-c('un','un','neg','neg','un','un','pos','un','pos',
          'un','un','un','un','un','pos','un','un','un','un','un')
hydropathy<-c('hydrophobic','hydrophobic','hydrophilic','
              hydrophilic','hydrophobic','neutral','neutral','hydrophobic','hydrophilic','hydrophobic','hydrophobic','hydrophilic','neutral',
              'hydrophilic','hydrophilic','neutral','neutral',
              'hydrophobic','hydrophobic','neutral')
volume.cat<-c('verysmall','small','small','medium',
              'verylarge','verysmall','medium','large','large',
              'large','large','small','small','medium','large','verysmall','small','medium','verylarge','verylarge')
polarity.cat<-c('nonpolar','nonpolar','polar','polar',
                'nonpolar','nonpolar','polar','nonpolar',
                'polar','nonpolar','nonpolar','polar','nonpolar','polar',
                'polar','polar','polar','nonpolar','nonpolar','polar')
chemical<-c('aliphatic','sulfur','acidic','acidic','aromatic',
            'aliphatic','basic','aliphatic','basic','aliphatic','sulfur',
            'amide','aliphatic','amide','basic','hydroxyl','hydroxyl',
            'aliphatic','aromatic','aromatic')

aa_dat <- data.frame(aa,MW.da,volume,bulkiness,
                     polarity,isoelectric.pt,hydrophobe.34,hydrophobe.35,
                     saaH2O,faal.fold, polar.req,freq,charge,hydropathy,volume.cat,polarity.cat,chemical)



usethis::use_data(aa_dat, overwrite = TRUE)

# compbio4all::make_dateset_helpfile(dataset = aa_dat,
#                       dataset_name = "aa_dat")


# old workflow
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
