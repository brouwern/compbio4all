## made dengue-related MSA sequence files

library(compbio4all)

# sequence accessions
seqnames <- c("P06747",
              "P0C569",
              "O56773",
              "Q5VKP1")

# get sequences
seq_1_2_3_4 <- entrez_fetch_list(db = "protein",
                                 id = seqnames,
                                 rettype = "fasta")

# clean sequences
seq_1_2_3_4[[1]] <- fasta_cleaner(seq_1_2_3_4[[1]])
seq_1_2_3_4[[2]] <- fasta_cleaner(seq_1_2_3_4[[2]])
seq_1_2_3_4[[3]] <- fasta_cleaner(seq_1_2_3_4[[3]])
seq_1_2_3_4[[4]] <- fasta_cleaner(seq_1_2_3_4[[4]])

# name the sequences
## NOTE: MUST be named in order for ggmsa to work!!!
seq_1_2_3_4 <- c(P06747 = paste(seq_1_2_3_4[[1]], collapse = ""),
                 P0C569 = paste(seq_1_2_3_4[[2]], collapse = ""),
                 O56773 = paste(seq_1_2_3_4[[3]], collapse = ""),
                 Q5VKP1 = paste(seq_1_2_3_4[[3]], collapse = ""))

# convert to AAStringSet
seq_1_2_3_4_stringset <- Biostrings::AAStringSet(seq_1_2_3_4)


# save

usethis::use_data(seq_1_2_3_4, overwrite = TRUE)
usethis::use_data(seq_1_2_3_4_stringset, overwrite = TRUE)

