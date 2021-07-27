library("biomaRt") # Load the biomaRt package in R
listEnsemblGenomes()        # List all Ensembl genomes that can be queried
ensemblprotists <- useEnsemblGenomes("protists_mart")
listDatasets(ensemblprotists)

#genome
ensemblleishmania <- useDataset("lmajor_eg_gene",
                                mart=ensemblprotists)
usethis::use_data(ensemblleishmania, overwrite = TRUE)

#genes
leishmaniagenes <- getBM(attributes = c("ensembl_gene_id"),
                         mart=ensemblleishmania)
usethis::use_data(leishmaniagenes, overwrite = TRUE)

#genes 2
leishmaniagenes2 <- getBM(attributes = c("ensembl_gene_id", "gene_biotype"),
                          mart=ensemblleishmania)
usethis::use_data(leishmaniagenes2, overwrite = TRUE)


# p fal
ensemblpfalciparum <- useDataset("pfalciparum_eg_gene",mart=ensemblprotists)
usethis::use_data(ensemblpfalciparum, overwrite = TRUE)

pfalciparumgenes <- getBM(attributes = c("ensembl_gene_id", "gene_biotype"),
                          mart=ensemblpfalciparum)

usethis::use_data(pfalciparumgenes, overwrite = TRUE)


