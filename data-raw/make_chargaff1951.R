

sample_name <- c("ox","human","wheatgerm", "yeast","avian_Tb","flu","E.coli","Serratia",
                 "Hydrogen_organism")
spp <- c("Box_taurus","Homo_sapiens","Triticum_vulgare",
        "Sccharomyces_cerevsiae","Mycobacterium_avium",
        "Haemophilus_influenzae","Escherichia_coli",
        "Marcescens","Bascilu_Schatz")
AvsG <- c(1.29, 1.56, 1.22,
          1.72, 0.4,  1.74,
          1.05, 0.7,  0.7)
TvsC <- c(1.43, 1.75,  1.18,
          1.9,  0.40,  1.54,
          0.95, 0.70,  0.60)
PuvsPy <- c(1.1, 1.0, 1.0, 1.0,
            1.1, 1.0, 1.0,
            0.9, 1.0)

chargaff1951 <- data.frame(sample_name, spp, AvsG, TvsC,PyvsPy)


# source Manchester 20xx Trends in Biochemical Sciences Vol.33 No.2
# Historical Opinion: Erwin Chargaff and
# his ‘rules’ for the base composition
# of DNA: why did he fail to see the
# possibility of complementarity?
#Adapted from Tables 4 from [2] and [21]. The third column is the ratio of purines to
#pyrimidines.
# Chargaff, E. (1951) Some recent studies on the composition and
# structure of nucleic acids. J. Cell. Comp. Physiol. 38 (suppl. 1), 41–59
# Chargaff, E. (1951) Structure and function of nucleic acids as cell
# constituents. Fed. Proc. 10, 654–659

usethis::use_r("chargaff1951")
usethis::use_data(chargaff1951,overwrite = TRUE)

chargaff1951

summary(chargaff1951)
mean(chargaff1951$PyvsPy)
sd(chargaff1951$PyvsPy)
