# made dengue-related MSA sequence files

library(compbio4all)

## PART 1: amino aciods


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
seq_1_2_3_4_vector <- c(P06747 = paste(seq_1_2_3_4[[1]], collapse = ""),
                 P0C569 = paste(seq_1_2_3_4[[2]], collapse = ""),
                 O56773 = paste(seq_1_2_3_4[[3]], collapse = ""),
                 Q5VKP1 = paste(seq_1_2_3_4[[4]], collapse = ""))

# convert to AAStringSet
seq_1_2_3_4_stringset <- Biostrings::AAStringSet(seq_1_2_3_4_vector)

# make MSA
library(msa)
virusaln <- msa(inputSeqs = seq_1_2_3_4_stringset,
method = "ClustalW")
class(virusaln) <- "AAMultipleAlignment"


# convert to seqinr format
virusaln_seqinr <- msaConvert(virusaln, type = "seqinr::alignment")

# clean poorl aligned sections
library(compbio4all)
virusaln_seqinr_clean <- clean_alignment(alignment = virusaln_seqinr,  # virusaln_seqinr
                                         minpcnongap = 30,
                                         minpcid = 30)

# save

## list
usethis::use_data(seq_1_2_3_4, overwrite = TRUE)

## stringset
usethis::use_data(seq_1_2_3_4_stringset, overwrite = TRUE)

## make data
usethis::use_data(virusaln, overwrite = TRUE)
usethis::use_data(virusaln_seqinr, overwrite = TRUE)
usethis::use_data(virusaln_seqinr_clean, overwrite = TRUE)



# Part 2: mRNA

# put accession in vector
accessions_mrna <- c("AF049118","AF049114","AF049119","AF049115")


virus_mrna_list <- entrez_fetch_list(db = "nuccore",  # "nuccore" db for DNA
                                     id = accessions_mrna,
                                     rettype = "FASTA") # rettype has two t

for(i in 1:length(virus_mrna_list)){
  virus_mrna_list[[i]] <- fasta_cleaner(virus_mrna_list[i],
                                        parse = F)
}


mra_seq_vector <- c(AF049118 =  virus_mrna_list[[1]] ,
                    AF049114 = virus_mrna_list[[2]] ,
                    AF049119 = virus_mrna_list[[3]] ,
                    AF049115 = virus_mrna_list[[4]])

dna_seq_stringset <- Biostrings::DNAStringSet(mra_seq_vector)


virus_mrna_aln <- msa(inputSeqs = dna_seq_stringset,
                      method = "ClustalW")

## Calculationg genetic distance

# Convert the alignment to "DNAbin" format
virus_mrna_aln_bin <- ape::as.DNAbin(virus_mrna_aln)


# Calculate the genetic distance matrix
virus_mrna_dist <- ape::dist.dna(virus_mrna_aln_bin)



## make data file
usethis::use_data(virus_mrna_dist, overwrite = TRUE)
usethis::use_data(virus_mrna_aln_bin, overwrite = TRUE)
usethis::use_data(virus_mrna_aln, overwrite = TRUE)
usethis::use_data(dna_seq_stringset, overwrite = TRUE)


## make stub for .r file
# usethis::use_r("virus_mrna_dist")
# usethis::use_r("virus_mrna_aln_bin")
# usethis::use_r("virus_mrna_aln")
# usethis::use_r("dna_seq_stringset")


