# Function to generate a DNA sequence, given a HMM and the length of the sequence to be generated.
#'
#' By Coghlan (2011), adapted from "Applied Statistics for Bioinformatics using R" by Wim P. Krijnen, page 209
# ( cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf )
#'
#' @param sequence sequence
#' @param transitionmatrix transitionmatrix
#' @param emissionmatrix emissionmatrix
#'
#' @export

viterbi <- function(sequence,
                    transitionmatrix,
                    emissionmatrix)

  # This carries out the Viterbi algorithm.
  # Adapted from "Applied Statistics for Bioinformatics using R" by Wim P. Krijnen, page 209
  # ( cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf )
{
  # Get the names of the states in the HMM:
  states <- rownames(emissionmatrix)

  # Make the Viterbi matrix v:
  v <- make_viterbi_mat(sequence,
                        transitionmatrix,
                        emissionmatrix)

  # Go through each of the rows of the matrix v (where each row represents
  # a position in the DNA sequence), and find out which column has the
  # maximum value for that row (where each column represents one state of
  # the HMM):
  mostprobablestatepath <- apply(v, 1, function(x) which.max(x))

  # Print out the most probable state path:
  prevnucleotide <- sequence[1]
  prevmostprobablestate <- mostprobablestatepath[1]
  prevmostprobablestatename <- states[prevmostprobablestate]
  startpos <- 1
  for (i in 2:length(sequence))
  {
    nucleotide <- sequence[i]
    mostprobablestate <- mostprobablestatepath[i]
    mostprobablestatename <- states[mostprobablestate]
    if (mostprobablestatename != prevmostprobablestatename)
    {
      print(paste("Positions",startpos,"-",(i-1), "Most probable state = ", prevmostprobablestatename))
      startpos <- i
    }
    prevnucleotide <- nucleotide
    prevmostprobablestatename <- mostprobablestatename
  }
  print(paste("Positions",startpos,"-",i, "Most probable state = ", prevmostprobablestatename))
}
