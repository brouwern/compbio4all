#' printPairwiseAlignment
#'
#' From Coghlan (2011) A little book of R for bioinformatics.
#' https://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter4.html
#'
#' This functions uses Biostrings::pattern() and IRanges::subject() from Bioconductor.
#'
#' @param alignment Alignment to print in console
#' @param chunksize chunksize
#' @param returnlist returnlist
#'
#' @export


print_pairwise_alignment <- function(alignment, chunksize=60, returnlist=FALSE)
{
  #library(Biostrings)           # This function requires the Biostrings package
  seq1aln <- Biostrings::pattern(alignment) # Get the alignment for the first sequence
  seq2aln <- IRanges::subject(alignment)    # Get the alignment for the second sequence
  alnlen  <- nchar(as.character(seq1aln))   # Find the number of columns in the alignment
  starts  <- seq(1, alnlen, by=chunksize)
  n       <- length(starts)
  seq1alnresidues <- 0
  seq2alnresidues <- 0

  for (i in 1:n) {
    chunkseq1aln <- substring(seq1aln, starts[i], starts[i]+chunksize-1)
    chunkseq2aln <- substring(seq2aln, starts[i], starts[i]+chunksize-1)

    # Find out how many gaps there are in chunkseq1aln:
    gaps1 <- Biostrings::countPattern("-",chunkseq1aln) # countPattern() is from Biostrings package
    # Find out how many gaps there are in chunkseq2aln:
    gaps2 <- Biostrings::countPattern("-",chunkseq2aln) # countPattern() is from Biostrings package
    # Calculate how many residues of the first sequence we have printed so far in the alignment:
    seq1alnresidues <- seq1alnresidues + chunksize - gaps1
    # Calculate how many residues of the second sequence we have printed so far in the alignment:
    seq2alnresidues <- seq2alnresidues + chunksize - gaps2
    if (returnlist == 'FALSE')
    {
      print(paste(chunkseq1aln,seq1alnresidues))
      print(paste(chunkseq2aln,seq2alnresidues))
      print(paste(' '))
    }
  }
  if (returnlist == 'TRUE')
  {
    vector1 <- seqinr::s2c(substring(seq1aln, 1, nchar(as.character(seq1aln))))
    vector2 <- seqinr::s2c(substring(seq2aln, 1, nchar(as.character(seq2aln))))
    mylist <- list(vector1, vector2)
    return(mylist)
  }
}
