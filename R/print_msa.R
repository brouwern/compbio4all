#' Print multiple sequence alignment (MSA) to R console
#'
#' From Coglan (2011) A little book of R for bioinformatics.
#' https://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/#
#' (Originally called printMsa)
#'
#' @param alignment Alignment object
#' @param chunksize width of alignment to output
#'
#' @export


print_msa <- function(alignment, chunksize=60)
{
  # this function originally required the Biostrings package
  # require("Biostrings")

  # find the number of sequences in the alignment
  numseqs <- alignment$nb
  # find the length of the alignment
  alignmentlen <- nchar(alignment$seq[[1]])
  starts <- seq(1, alignmentlen, by=chunksize)
  n <- length(starts)
  # get the alignment for each of the sequences:
  aln <- vector()
  lettersprinted <- vector()
  for (j in 1:numseqs)
  {
    alignmentj <- alignment$seq[[j]]
    aln[j] <- alignmentj
    lettersprinted[j] <- 0
  }
  # print out the alignment in blocks of 'chunksize' columns:
  for (i in 1:n) { # for each of n chunks
    for (j in 1:numseqs)
    {
      alnj <- aln[j]
      chunkseqjaln <- substring(alnj, starts[i], starts[i]+chunksize-1)
      chunkseqjaln <- toupper(chunkseqjaln)

      # Find out how many gaps there are in chunkseqjaln:
      ## Original using Biostrings
      ### gapsj <- Biostrings::countPattern("-",chunkseqjaln) # countPattern() is from Biostrings package

      ### new using stringr
      gapsj <- stringr::str_count(chunkseqjaln, pattern = "")

      # Calculate how many residues of the first sequence we have printed so far in the alignment:
      lettersprinted[j] <- lettersprinted[j] + chunksize - gapsj
      print(paste(chunkseqjaln,lettersprinted[j]))
    }
    print(paste(' '))
  }
}
