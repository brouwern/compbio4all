#' Function to identify potential start and stop codons
#'
#' By Coghlan (2011) A little book of R for bioinformatics.
#' https://a-little-book-of-r-for-bioinformatics.readthedocs.io/en/latest/src/chapter7.html.
#' The functions was originally named findPotentialStartsAndStops().
#'
#' Searches a DNA sequence using Biostrings::matchPattern(codon, sequence) to look for start and stop codons.
#' Currently only uses the standard genetic code.
#'
#' @param sq DNA sequence
#'
#' @examples
#' # Example sequence from Coghlan 2011
#' s1 <- "aaaatgcagtaacccatgccc"
#'
#' # Returns a list with 2 elements
#' ## 1) locations of codons
#' ## 2) The codon
#' find_start_stop_codons(s1)
#'
#' @export

find_start_stop_codons <- function(sq)
{

  # Define a vector with the sequences of potential start and stop codons
  ## (standard DNA code)
  codons            <- c("atg", "taa", "tag", "tga")

  # Find the number of occurrences of each type of potential start or stop codon
  for (i in 1:4)
  {
    codon <- codons[i]
    # Find all occurrences of codon "codon" in sequence "sq"
    occurrences <- Biostrings::matchPattern(codon, sq)

    # Find the start positions of all occurrences of "codon" in sequence "sq"
    codonpositions <- occurrences@ranges@start

     # Find the total number of potential start and stop codons in sequence "sq"
    numoccurrences <- length(codonpositions)
    if (i == 1)
    {
      # Make a copy of vector "codonpositions" called "positions"
      positions <- codonpositions
      # Make a vector "types" containing "numoccurrences" copies of "codon"
      types <- rep(codon, numoccurrences)
    }
    else
    {
      # Add the vector "codonpositions" to the end of vector "positions":
      positions   <- append(positions, codonpositions, after=length(positions))
      # Add the vector "rep(codon, numoccurrences)" to the end of vector "types":
      types       <- append(types, rep(codon, numoccurrences), after=length(types))
    }
  }

   # Sort the vectors "positions" and "types" in order of position along the input sequence:
  indices <- order(positions)
  positions <- positions[indices]
  types <- types[indices]

  # Return a list variable including vectors "positions" and "types":
  mylist <- list(positions = positions,
                 types = types)
  return(mylist)
}
