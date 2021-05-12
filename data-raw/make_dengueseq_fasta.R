## code to prepare `dengueseq` dataset goes here

dengueseq_fasta <- rentrez::entrez_fetch(db = "nucleotide",
                          id = "NC_001477",
                          rettype = "fasta")
usethis::use_r("dengueseq_fasta")
usethis::use_data(dengueseq_fasta,overwrite = TRUE)

file. <- here::here("inst/extdata/dengueseq.fasta")
write(dengueseq_fasta, file=file.)
