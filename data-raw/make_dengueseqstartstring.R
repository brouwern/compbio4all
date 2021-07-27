
# From https://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter7.html
# exampl for Computational gene finding

data(dengueseq_fasta)
dengueseq_fasta <- gsub("\n", "", dengueseq_fasta)
header. <- ">NC_001477.1 Dengue virus 1, complete genome"
dengueseq_fasta <- gsub(header.,"", dengueseq_fasta)
dengueseq_fasta_vector <- stringr::str_split(dengueseq_fasta,"")
dengueseq_fasta_vector <- unlist(dengueseq_fasta_vector)
dengueseqstart <- dengueseq_fasta_vector[1:500]
dengueseqstartstring <- seqinr::c2s(dengueseqstart)
dengueseqstartstring <- tolower(dengueseqstartstring)


#genome
usethis::use_data(dengueseqstartstring, overwrite = TRUE)



